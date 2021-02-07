time_t rawtime;
tm timestruct;

void TimeModule(){
  rawtime = time(0);
  timestruct = *localtime(&rawtime);

  printf("%02d:%02d:%02d", timestruct.tm_hour , timestruct.tm_min, timestruct.tm_sec);
}
