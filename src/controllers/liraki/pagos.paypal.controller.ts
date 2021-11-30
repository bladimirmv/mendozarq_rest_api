import { Request, Response } from "express";
import { PAYPAL_API, PAYPAL_API_CLIENT, PAYPAL_API_SECRET, SERVER_PORT } from './../../global/enviroment';
import axios from 'axios';

export const createOrder = async (req: Request, res: Response) => {

  try {
    const order = {
      intent: "CAPTURE",
      purchase_units: [
        {
          amount: {
            currency_code: "USD",
            value: "105.70",
          },
          description: 'teclado de una computadora'
        },
      ],
      application_context: {
        brand_name: "mycompany.com",
        landing_page: "LOGIN",
        user_action: "PAY_NOW",
        return_url: `http://localhost:${SERVER_PORT}/api/paypal/capture-order`,
        cancel_url: `http://localhost:${SERVER_PORT}/api/paypal/cancel-order`,
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


    return res.json(response.data);
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

    res.redirect("/payed.html");
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(500).json({
      message: error
    });
  }
}


export const cancelOrder = (req: Request, res: Response) => {
  res.redirect("/");
}


// weimar@liraki.com
// wnq7I3?9

// }k+G&HL9
// bladimilmedranoblod_@hotmail.com