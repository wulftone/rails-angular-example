`var win = typeof(window) === 'undefined' ? {} : window`
`var mod = typeof(module) === 'undefined' ? {} : module`
win.angularApp = win.angularApp || {}

win.angular.module('mongolab', ['ngResource'])
  .factory 'Cars', ($resource) ->
    $resource '/cars/:car_id', { car_id: '@id' },
      index: { method: 'GET', isArray: true},
      create: { method: 'POST' }

  .factory 'Car', ($resource) ->
    Car = $resource '/cars/:car_id', { car_id: '@id' },
      index: { method: 'GET', isArray: true },
      new: { method: 'GET' },
      create: { method: 'POST' },
      show: { method: 'GET' },
      edit: { method: 'GET' },
      update: { method: 'PUT' },
      destroy: { method: 'DELETE' }
