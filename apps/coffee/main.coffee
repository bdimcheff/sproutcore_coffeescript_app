Coffee.main = ->
  Coffee.getPath('mainPage.mainPane').append()
  query = SC.Query.local(Coffee.Task, { orderBy: "isDone,description" })
  tasks = Coffee.store.find(query)
  Coffee.tasksController.set('content', tasks)

window.main = ->
  Coffee.main()
