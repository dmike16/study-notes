## Register a Service Worker

First thing to do is register a service worker. This is done cheking if
`serviceWorker in Navigator` and `PushMenager in window`. The first is relative
to ServiceWorker functinality and the latter to PushMessaging. If the check pass
register the serviceWorker using the `register` method from Service Worker Api.

``` javascript
if ('serviceWorker' in navigator && 'PushManager' in window) {
  console.log('Service Worker and Push are supported');

  navigator.serviceWorker.register('sw.js')
  .then(function(swReg) {
    console.log('Service Worker is registered', swReg);

    swRegistration = swReg;
  })
  .catch(function(error) {
    console.error('Service Worker Error', error);
  });
} else {
  console.warn('Push messaging is not supported');
  pushButton.textContent = 'Push Not Supported';
}
```
