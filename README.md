
# Login
User login flow and user keys management for TIKI app.

## How to Use
1. Construct Login passing the home widget to be shown after the user is logged in.
2. Initialize using the `init()` method
3. Use the `routerDelegate` as RouterDelegate for the app.

## Documentation

#### initializer
Initializes the Login data and loads dependencies.
`Future<void> init() => _flowService.loadModel()`
#### routerDelegate
RouterDelegate to handle the login flow navigation.
`RouterDelegate get routerDelegate => _flowService.presenter`
#### onLogout
Callback subscriber for logout actions.
`void onLogout(String id, void Function() callback) => _flowService.addLogoutCallback(id, callback)`
#### onLogin
Callback subscriber for logout actions.
`void onLogin(String id, void Function() callback) => _flowService.addLoginCallback(id, callback);`
#### user
User getter.
`FlowModelUser? get user => _flowService.model.user`
#### token
Token getter.
`FlowModelToken? get token => _flowService.model.token`
#### refresh
Refresh user tokens.
`Future<void> refresh(void Function(String?)? onComplete) => _flowService.refresh(onComplete)`
#### logout
Logout action
`Future<void> logout() => _flowService.logout()`

## How to contribute
Thank you for contributing with the data revolution!  
All the information about contribution can be found in [CONTRIBUTING](https://github.com/tiki/app/CONTRIBUTING.md)

## License
MIT license