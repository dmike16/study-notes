## Web Push Protocol

![WebPush Flow](@webfundImages/web-push.svg)

### Web Push VAPID

*VAPID*(Voluntary Application Server Identifier) it's a system whereby an application
server can identify itself to the push server. The step to build a VAPID are:

. Generate and mantain a keys pair generated with ECDSA over a P-256 curve, send
the public key to the push server during subscription,

. in the request of push message include a ''JWT'' signed with the private key
generated above using a ES256 algorithm

. insert two header :
* *Authoritazion*: `Web Push <JWT>`
* *Crypto-Key*: `ps56ecdsa=<public-key>`

![VPID](@webfundImages/vapid.svg)

### Jason Web Token (JWT)

The JWT is a way of sending informations to third party so that the reciver can
validate who sent it. A signed JWT is just three strings diveded by a dot.

![JWT](@webfundImages/jwt.svg)

* The first string it's a json url-base64 encoded and rappresents information
about the JWT for web push must be :

``` json
{
  "aud": "<endpoint>",
  "exp": "<expiration time in seconds>",
  "sub": "mailto:<email@email.com> | <url>"
}
```

The expiration time must be no longer 24 hours.

* the third string is the signature and it's the result of taking the first two
strings joining them with a dot and signing it. The algo used is ES256 = ECDSA
using P-256 curve and the SHA-256 algorithm.

Then we have to create two header

```
Authorization: 'WebPush <JWT Info>.<JWT Data>.<Signature>' 
Crypto-Key: p256ecdsa=<URL Safe Base64 Public Application Server Key>
```
