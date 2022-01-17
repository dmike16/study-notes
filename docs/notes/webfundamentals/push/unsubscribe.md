## Unsubscribe

To unsubscribe a user from web push notification, we have to get the subscribtion
objct and call the `unsubscribe()` method:

``` javascript
function unsubscribeUser(){
    swReg.pushManager.getSubscription().then((sub)=>{
      if(sub){
        return sub.unsubscribe();
      }
    }).catch((err)=>{
      console.log('Error during unsubsription ',err);
    }).then(()=>{
      updateSubscription(null);
      console.log('User is unsubsribed');
      isSubscribed = false;
      updateBtn();
    });
  }
```
