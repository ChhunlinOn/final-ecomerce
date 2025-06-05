module ApplicationHelper
    def icon(*classes)
      content_tag(:i, nil, class: classes.join(' '))
    end
  end
  