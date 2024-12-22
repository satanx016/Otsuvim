;; extends
(field
  name: (identifier) @value.outer
  "=" value: (_) @value.inner)

(assignment_statement
  (variable_list
    name: (_) @value.outer)
  "=" (expression_list
        value: (_) @value.inner ))
