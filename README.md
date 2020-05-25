# Superhero

This project enables the searching and showing of Superhero characters form [Superhero API](https://superheroapi.com).

The project uses [cocoapods-keys](https://guides.cocoapods.org/plugins/environment-vars.html) plugin to keep API secrets outside of the source code.


#### Dependancies
The project has cocoapods as a dependancy management

* To install dependancies you need to have cocoapods-keys plugin and  [bundler](https://bundler.io/) installed.
* Open terminal application then navigate to project directory, and run.

```bash
bundle exec pod install
```

#### Testing

For testing the following libraries are utilised:

* Cuckoo for generating mocks
* Nimbele for testing callbacks and completion blocks

#### Running the project
If you are getting `Access denied` error when running the application it might be caused by access token request limit or some other unknow API error, to solve this error you need to update the `AccessToken` cocoapods-key value with a new access token, access token can be obtained from the superhero api docs website. 

From the project directory run the following command on terminal to set a new access token:

```bash
bundle exec pod keys set AccessToken value
```

