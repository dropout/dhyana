import { z } from 'zod';

export const ProfileSchema = z.object({
  id: z.string(),
  firstName: z.string(),
  lastName: z.string(),
  email: z.string().email(),
  photoUrl: z.string(),
  photoBlurhash: z.string(),
  signupDate: z.number(),
  statsReport: ProfileStatisticsReportSchema,
  completed: z.boolean(),
});
export type Profile = z.infer<typeof ProfileSchema>;

export const ProfileStatisticsReportSchema = z.object({
  consecutiveDays: z.object({
    current: z.number(),
    longest: z.number(),
    startedAt: z.number().nullable(),
    lastChecked: z.number().nullable(),
  }),
  milestoneProgress: z.object({
    completedDaysCount: z.number(),
    targetDaysCount: z.number(),
    sessions: z.array(z.unknown()),
  }),
  milestoneCount: z.number(),
  completedMinutesCount: z.number(),
  completedSessionsCount: z.number(),
  completedDaysCount: z.number(),
  firstSessionDate: z.number().nullable(),
  lastSessionDate: z.number().nullable(),
});
export type ProfileStatisticsReport = z.infer<typeof ProfileStatisticsReportSchema>;

export const ConsecutiveDaysSchema = z.object({
  current: z.number(),
  longest: z.number(),
  startedAt: z.number().nullable(),
  lastChecked: z.number().nullable(),
});
export type ConsecutiveDays = z.infer<typeof ConsecutiveDaysSchema>;

export const MilestoneProgressSchema = z.object({
  completedDaysCount: z.number(),
  targetDaysCount: z.number(),
  sessions: z.array(z.unknown()),
});
export type MilestoneProgress = z.infer<typeof MilestoneProgressSchema>;

export const CityLocationSchema = z.object({
  latitude: z.number(),
  longitude: z.number(),
});
export const CitySearchResultSchema = z.object({
  placeId: z.string(),
  name: z.string(),
  types: z.array(z.string()),
  location: CityLocationSchema.nullable().optional(),
});
export type CitySearchResult = z.infer<typeof CitySearchResultSchema>;

export const CitySearchResponseSchema = z.object({
  queryString: z.string(),
  results: z.array(CitySearchResultSchema),
});
export type CitySearchResponse = z.infer<typeof CitySearchResponseSchema>;
