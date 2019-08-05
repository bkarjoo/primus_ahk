updated(what) {
  i_file := "rules\" . what . ".c"
  bu_file := "pp\" . what . "_bu.i"
  FileGetTime, i_time, %i_file%
  FileGetTime, bu_time, %bu_file%
  return i_time > bu_time
}
