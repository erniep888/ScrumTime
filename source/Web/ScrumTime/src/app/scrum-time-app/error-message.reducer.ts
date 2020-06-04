import { createReducer, on } from '@ngrx/store';

import { errorOccurred } from '../scrum-time-common/error.action';

export const errorMessageReducer = createReducer('',
  on(errorOccurred, (_, action) => action.errorMessage),
);