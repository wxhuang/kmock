# kmock
A mock server base on koa2 and dockerlized.

# Usage
## docker container
Run the container looks like this
```
$ docker run -d -p 80:3000 -v /host/routes.js:/node-app/routes.js asdfplus/kmock
```

## routes.js
A configure file must be mounted in the container, it looks like this:
```js
module.exports = [
  ['get', '/hello', async (ctx) => {
    ctx.body = {
      message: "hello"
    }
  }],
  ['post', '/cert', async (ctx) => {
    const data = ctx.request.body;
    ctx.body = {
      message: data
    }
  }]
]
```
More details about ``ctx.request.body`` on [koa-bodyparser](https://github.com/koajs/bodyparser).