## Subscribe

To subscribe we use the function `subscribe()` from PushManager API.
It returns a Promise that resolve if the following steps has completed :

* The user has granted permission to push notification
* The broswer has sent a network request to a push server to get the details to
generate a push subscription.

The method acept a javascript object like argument:

``` javascript
{
  userVisibleOnly: true,
  applicationServerKey: applicationServerKey
}
```

* _userVisibleOnly_: this  parameter is an admission that you will show a notification
every time a push is sent, it's requered and must  be true.
applicationServerKey:: is  a public key your push server will use to send messages
to client apps via the push server and must be of type `UInt8Array`.
