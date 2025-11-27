import {z} from "zod";

export const CitySearchResultSchema = z.object({
  placeId: z.string().min(1),
  name: z.string().min(1),
  types: z.array(z.string()).default([]),
  location: z.object({
    latitude: z.number(),
    longitude: z.number(),
  }).nullable().optional(),
});

export type CitySearchResultSchemaType = z.infer<typeof CitySearchResultSchema>;

export default CitySearchResultSchema;
