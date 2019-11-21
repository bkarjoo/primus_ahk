build_box_name(box_name, box_version) {
  name := box_name . " " . box_version
  return name
}

build_box_description(launch_name, desc, basket) {
  name := launch_name . " b: " . basket . " d: " . desc
  return name
}
