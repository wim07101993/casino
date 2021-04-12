package main

import (
	"github.com/julienschmidt/httprouter"
	"log"
	"net/http"
)

type Router struct {
	baseRouter *httprouter.Router
}

func NewRouter() *Router {
	return &Router{
		baseRouter: httprouter.New(),
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
	return func(w http.ResponseWriter, r *http.Request, ps httprouter.Params) {
		log.Println(r.Method + ":" + r.RequestURI)
		handle(w, r, ps)
	}
}
