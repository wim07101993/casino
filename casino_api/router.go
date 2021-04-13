package main

import (
	"cloud.google.com/go/logging"
	"github.com/julienschmidt/httprouter"
	"net/http"
)

type Router struct {
	baseRouter *httprouter.Router
	logger     *logging.Logger
}

func NewRouter(logger *logging.Logger) *Router {
	return &Router{
		baseRouter: httprouter.New(),
		logger:     logger,
	}
}

func (r *Router) POST(path string, handle httprouter.Handle) {
	r.baseRouter.POST(path, r.log(handle))
}

func (r *Router) GET(path string, handle httprouter.Handle) {
	r.baseRouter.GET(path, r.log(handle))
}

func (r *Router) PUT(path string, handle httprouter.Handle) {
	r.baseRouter.PUT(path, r.log(handle))
}

func (r *Router) DELETE(path string, handle httprouter.Handle) {
	r.baseRouter.DELETE(path, r.log(handle))
}

func (r *Router) ServeHTTP(w http.ResponseWriter, req *http.Request) {
	r.baseRouter.ServeHTTP(w, req)
}

func (r *Router) log(handle httprouter.Handle) httprouter.Handle {
	return func(w http.ResponseWriter, req *http.Request, ps httprouter.Params) {
		r.logger.StandardLogger(logging.Info).Println(req.Method + ":" + req.RequestURI)
		handle(w, req, ps)
	}
}
