export interface Profile {
  id: string;
  firstName: string;
  lastName: string;
  email: string;
  photoUrl: string;
  photoBlurhash: string;
  signupDate: number;
  statsReport: ProfileStatisticsReport;
  completed: boolean;
}

export interface ProfileStatisticsReport {
  consecutiveDays: ConsecutiveDays;
  milestoneProgress: MilestoneProgress;
  milestoneCount: number;
  completedMinutesCount: number;
  completedSessionsCount: number;
  completedDaysCount: number;
  firstSessionDate: number | null;
  lastSessionDate: number | null;
}

export interface ConsecutiveDays {
  current: number;
  longest: number;
  startedAt: number | null;
  lastChecked: number | null;
}

export interface MilestoneProgress {
  completedDaysCount: number;
  targetDaysCount: number;
  sessions: [];
}
