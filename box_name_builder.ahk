build_box_name(box_name, acronym) {
  name := acronym . " " . box_name
  return name
}

build_box_description(launch_name, desc, basket) {
  name := launch_name . " b: " . basket . " d: " . desc
  return name
}
