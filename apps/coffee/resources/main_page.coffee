Coffee.mainPage = SC.Page.design
  mainPane: SC.MainPane.design
    childViews: 'labelView'.w()
    labelView: SC.LabelView.design
      layout: { centerX: 0, centerY: 0, width: 200, height: 18 }
      textAlign: SC.ALIGN_CENTER
      tagName: "h1"
      value: "Welcome to SproutCore!"

