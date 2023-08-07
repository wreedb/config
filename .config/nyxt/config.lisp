
(define-configuration buffer
  ((default-modes
     (pushnew 'nyxt/mode/emacs:emacs-mode %slot-value%))))

(define-configuration browser
  ((theme
    (make-instance 'theme:theme :background-color "black"
                   :on-background-color "#808080" :accent-color
                   "#37a8e4" :on-accent-color "black" :primary-color
                   "gray" :on-primary-color "white" :secondary-color
                   "darkgray" :on-secondary-color "black")
    :doc
    "You can omit the colors you like in default theme, and they will stay as they were.")))
