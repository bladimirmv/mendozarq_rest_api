import { Request, Response } from "express";
import { PAYPAL_API, PAYPAL_API_CLIENT, PAYPAL_API_SECRET, SERVER_PORT } from './../../global/enviroment';
import axios from 'axios';

export const createOrder = async (req: Request, res: Response) => {

  try {
    const order: any = {
      intent: 'CAPTURE',
      purchase_units: [{
        amount: {
          currency_code: 'USD',
          value: '10.20'
        },
        description: 'teclado de una computadora'
      }],
      order_application_context: {
        brand_name: 'liraki.com',
        landing_page: 'LOGIN',
        user_action: 'PAY_NOW',
        return_url: `http://localhost:${SERVER_PORT}/api/paypal/capture-order`,
        cancel_url: `http://localhost:${SERVER_PORT}/api/paypal/cancel-order`
      }
    }

    const params = new URLSearchParams();
    params.append('grant_type', 'client_credentials')

    const { data: { access_token } } = await axios.post('https://api-m.sandbox.paypal.com/v1/oauth2/token', params, {
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      },

      auth: {
        username: PAYPAL_API_CLIENT,
        password: PAYPAL_API_SECRET
      }
    })

    const response = await axios.post(`${PAYPAL_API}/v2/checkout/orders`, order, {
      headers: {
        Authorization: `Bearer ${access_token}`
      }
      // auth: {
      //   username: PAYPAL_API_CLIENT,
      //   password: PAYPAL_API_SECRET
      // },
    });

    console.log(response.data);

    res.send('çreating order')
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(500).json({
      message: error
    });
  }
};

export const captureOrder = (req: Request, res: Response) => {

}


export const cancelOrder = (req: Request, res: Response) => {

}