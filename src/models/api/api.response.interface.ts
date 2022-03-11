export interface ApiResponse<T> {
  info: {
    count: number;
    pages: number;
    next: string;
    prev: string | null;
  };
  results?: Array<T>;
}
