;; extends
(field
  name: (identifier) @value.outer
  "=" value: (_) @value.inner)

(assignment_statement
  (variable_list) @value.outer
  "=" (expression_list) @value.inner)
