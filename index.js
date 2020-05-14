const Koa = require('koa');
const Router = require('koa-router');
const bodyParser = require('koa-bodyparser');
  
const app = new Koa();
const router = new Router();

const registerRoute = function(handlers) {
  for(const [method, route, handler] of handlers) {
    router[method](route, handler);
  }
}

const routes = require('./routes');
registerRoute(routes);

router.get('/', (ctx, next) => {
  ctx.body = {
    message: 'hello'
  }
 });
  
app
 .use(bodyParser())
 .use(router.routes())
 .use(router.allowedMethods());
  
app.listen(3000);