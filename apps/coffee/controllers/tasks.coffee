Coffee.tasksController = SC.ArrayController.create(
  SC.CollectionViewDelegate
  summary: ( ->
    len = this.get('length')
    ret = "No tasks"
 
    if len && len > 0
      if len == 1
        ret = "1 task"
      else
        ret = "#{len} tasks"

    ret ).property('length').cacheable()
  collectionViewDeleteContent: (view, content, indexes) ->
    records = indexes.map (idx) =>
      this.objectAt(idx)
    records.invoke 'destroy'

    selIndex = indexes.get 'min' - 1
    if selIndex < 0 then selIndex = 0
    this.selectObject(this.objectAt(selIndex))
  addTask: ->
    task = Coffee.store.createRecord Coffee.Task,
      description: "New Task"
      isDone: false

    this.selectObject(task)

    this.invokeLater ->
      contentIndex = this.indexOf(task)
      list = Coffee.mainPage.getPath('mainPane.middleView.contentView')
      listItem = list.itemViewForContentIndex(contentIndex)
      listItem.beginEditing()

    YES
)
