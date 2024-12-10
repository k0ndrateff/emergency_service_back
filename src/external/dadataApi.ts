import axios from "axios";
import * as process from "node:process";
import {Geolocation} from "../models/Geolocation";
import dotenv from "dotenv";

dotenv.config();

class DadataApi {
  private token = process.env.DADATA_TOKEN as string;

  geoCode = async (address: string): Promise<Geolocation | undefined> => {
    try {
      const response = await axios.post("http://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address", JSON.stringify({ query: address }), {
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Token " + this.token
        }
      });

      const suggestion = response.data?.suggestions?.[0]?.data;

      return {
        lat: suggestion.geo_lat,
        lon: suggestion.geo_lon,
      };
    }
    catch (error) {
      console.error(`Failed to geocode address ${address}: ${error}`);
    }
  };
}

export const dadataApi = new DadataApi();
