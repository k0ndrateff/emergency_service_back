import axios from "axios";

class DadataApi {
  private token: string = "36c47f1b48ba4024e1981e9c1d1303163a2a99c5";

  geoCode = async (address: string): Promise<{ lat: number; lon: number; } | undefined> => {
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
