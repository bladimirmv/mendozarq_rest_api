import { Request, Response } from "express";
import { CLIENT_URL, HOST_API, PAYPAL_API, PAYPAL_API_CLIENT, PAYPAL_API_SECRET } from './../../global/enviroment';
import axios from 'axios';

export const createOrder = async (req: Request, res: Response) => {

  try {
    const order = {
      intent: "CAPTURE",
      purchase_units: [
        {
          amount: {
            currency_code: "USD",
            value: "100.40",
          },
          description: 'puerta de madera'
        },
      ],
      application_context: {
        brand_name: 'Carpinteria LIRAKI',
        landing_page: "LOGIN",
        user_action: "PAY_NOW",
        return_url: `${HOST_API}/api/paypal/capture-order`,
        cancel_url: `${CLIENT_URL}/`,
      },
    };

    // format the body
    const params = new URLSearchParams();
    params.append("grant_type", "client_credentials");

    // Generate an access token
    const {
      data: { access_token },
    } = await axios.post(
      "https://api-m.sandbox.paypal.com/v1/oauth2/token",
      params,
      {
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        auth: {
          username: PAYPAL_API_CLIENT,
          password: PAYPAL_API_SECRET,
        },
      }
    );

    // make a request
    const response = await axios.post(
      `${PAYPAL_API}/v2/checkout/orders`,
      order,
      {
        headers: {
          Authorization: `Bearer ${access_token}`,
        },
      }
    );


    return res.status(200).json(response.data);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(500).json({
      message: error
    });
  }
};

export const captureOrder = async (req: Request, res: Response) => {
  const { token } = req.query;

  try {
    const response = await axios.post(
      `${PAYPAL_API}/v2/checkout/orders/${token}/capture`,
      {},
      {
        auth: {
          username: PAYPAL_API_CLIENT,
          password: PAYPAL_API_SECRET,
        },
      }
    );

    console.log(response.data);

    res.redirect(`${CLIENT_URL}/profile`);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(500).json({
      message: error
    });
  }
}


export const cancelOrder = (req: Request, res: Response) => {
  res.redirect(`${CLIENT_URL}/`);
}


