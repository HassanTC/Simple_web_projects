# checkyapi web services
>  database-driven RESTful API web service that looks up received `gem_name` and `os_name`
returns a list of system libraries to install it into your machine
check the following url http://checkyapi.herokuapp.com/

## Ruby version is ruby 2.2.2

## You can Run `rspec` and see full testcases

## Simple You can run `rake doc:app` and see full documentation

## Check for Gem dependencies.

> send your gem and OS info and it will returns a libararies to install

Url: `/checky`

Method: `GET`

params required:
```
{
  "os_name"=>"testing_os",
  "gem_name"=>"testing_gem"
}
```
Return Back if found:
```
{
  :total => 1, :libararies => ["testing_lib"],
  :install_code => "apt-get install", :status => 200
}
```
Return if not Found:
```
{
  :erorr=> 'Not found!',
  :status=>404
}
```
### API to let Users contributes into Database
Url: `/checky`

Method: `POST`

params required:
```
{
  "gemname"=>"new_test", "install_code"=>"sudo apt",
  "os_name"=>"fedra", "systemlib_name" => "libtest"
}
```
Return When Data Issue:
```
{
  "erorrs":{
    "rgem_id":["can't be blank"],
    "systemlib_id":["can't be blank"],
    "osystem_id":["can't be blank"]
  }
}
```
Return when added succeffuly:
```
{
  msg: "Gem added succefully"
}
```
