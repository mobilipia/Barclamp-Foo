name "foo-server"
description "Foo Servier Role"
run_list(
         "recipe[foo::api]",
         "recipe[foo::monitor]"
)
default_attributes()
override_attributes()

