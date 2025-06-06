module ApplicationHelper
    def form_field_classes(record, attribute)
      base_classes = "block shadow-sm rounded-md border px-3 py-2 mt-2 w-full"
      error_classes = record.errors[attribute].any? ? "border-red-400 focus:outline-red-600" : "border-gray-400 focus:outline-blue-600"
      [base_classes, error_classes].join(" ")
    end
  end