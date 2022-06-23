;; Official port forked from kborling -*- lexical-binding: t; -*-
;; Everblush Colorscheme 
;; Maintained by : Mangeshrex
;; Tested By : SamuelNihbos

(deftheme everblush "everblush")

;;; Variables
(eval-and-compile
  (defvar everblush-colors-alist
    '(("everblush-fg"                . "#dadada")
      ("everblush-bg"                . "#181f21")
      ("everblush-black"             . "#22292b")
      ("everblush-red"               . "#e06e6e")
      ("everblush-green"             . "#8ccf7e")
      ("everblush-yellow"            . "#e5c76b")
      ("everblush-blue"              . "#67b0e8")
      ("everblush-magenta"           . "#c47fd5")
      ("everblush-cyan"              . "#6da4cd")
      ("everblush-white"             . "#b3b9b8")
      ("everblush-bright-black"      . "#3b4244")
      ("everblush-bright-red"        . "#ef7d7d")
      ("everblush-bright-green"      . "#9bdead")
      ("everblush-bright-yellow"     . "#f4d67a")
      ("everblush-bright-blue"       . "#6cb5ed")
      ("everblush-bright-magenta"    . "#ce89df")
      ("everblush-bright-cyan"       . "#67cbe7")
      ("everblush-bright-white"      . "#dadada")
      ("everblush-comment"           . "#454c4e")
      ("everblush-highlight"         . "#2c3335")
      ("everblush-warning"           . "#f4d67a")
      ("everblush-error"             . "#e06e6e"))))

(defvar everblush-use-variable-pitch nil
  "When non-nil, use variable pitch face for some headings and titles.")

(defvar everblush-scale-org-headlines nil
  "Whether `org-mode' headlines should be scaled.")

(defvar everblush-scale-outline-headlines nil
  "Whether `outline-mode' headlines should be scaled.")

(defvar everblush-scale-shr-headlines nil
  "Whether `shr' headlines should be scaled.")

(defcustom everblush-distinct-line-numbers t
  "Whether line numbers should look distinct."
  :type 'boolean
  :group 'everblush
  :package-version '(everblush . "1.0"))

(defcustom everblush-height-minus-1 0.8
  "Font size -1."
  :type 'number
  :group 'everblush
  :package-version '(everblush . "1.0"))

(defcustom everblush-height-plus-1 1.075
  "Font size +1."
  :type 'number
  :group 'everblush
  :package-version '(everblush . "1.0"))

(defcustom everblush-height-plus-2 1.1
  "Font size +1."
  :type 'number
  :group 'everblush
  :package-version '(everblush . "1.0"))

(defcustom everblush-height-plus-3 1.125
  "Font size +2."
  :type 'number
  :group 'everblush
  :package-version '(everblush . "1.0"))

(defcustom everblush-height-plus-4 1.15
  "Font size +3."
  :type 'number
  :group 'everblush
  :package-version '(everblush . "1.0"))

(defcustom everblush-height-plus-5 1.2
  "Font size +4."
  :type 'number
  :group 'everblush
  :package-version '(everblush . "1.0"))

(defcustom everblush-height-plus-6 1.3
  "Font size +5."
  :type 'number
  :group 'everblush
  :package-version '(everblush . "1.0"))

(defmacro everblush-with-color-variables (&rest body)
  "`let' bind all colors defined in `everblush-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   (append everblush-colors-alist))
         (z-variable-pitch (if everblush-use-variable-pitch
                               'variable-pitch 'default)))
     ,@body))

;;; Theme Faces
(everblush-with-color-variables
  (custom-theme-set-faces 'everblush
                          '(button ((t (:underline t))))
                          `(default ((t (:background ,everblush-bg :foreground ,everblush-fg))))
                          `(cursor ((t (:background ,everblush-white :foreground ,everblush-bright-black))))
                          `(link ((t (:underline t :foreground ,everblush-blue))))
                          `(link-visited ((t (:underline t :foreground ,everblush-bright-blue))))
                          `(underline ((t (:underline t :foreground ,everblush-yellow))))
                          `(font-lock-keyword-face ((t (:foreground ,everblush-magenta))))
                          `(font-lock-function-name-face ((t (:foreground ,everblush-blue))))
                          `(font-lock-string-face ((t (:foreground ,everblush-green))))
                          `(font-lock-warning-face ((t (:inverse-video t :background ,everblush-bg :foreground ,everblush-error))))
                          `(font-lock-type-face ((t (:weight bold :foreground ,everblush-yellow))))
                          `(font-lock-preprocessor-face ((t (:foreground ,everblush-blue))))
                          `(font-lock-builtin-face ((t (:weight bold :foreground ,everblush-yellow))))
                          `(font-lock-variable-name-face ((t (:foreground ,everblush-red))))
                          `(font-lock-constant-face ((t (:foreground ,everblush-yellow))))
                          `(font-lock-doc-face ((t (:slant italic :foreground ,everblush-comment))))
                          `(font-lock-comment-face ((t (:slant italic :foreground ,everblush-comment))))
                          `(shadow ((t (:foreground ,everblush-comment))))
                          `(Info-quoted ((t (:inherit font-lock-constant-face))))
                          `(show-paren-match-face ((t (:inverse-video t :background ,everblush-white :foreground ,everblush-red))))
                          `(highline-face ((t (:background ,everblush-black))))
                          `(ac-selection-face ((t (:background ,everblush-magenta :foreground ,everblush-highlight))))
                          `(ac-candidate-face ((t (:background ,everblush-black :foreground ,everblush-white))))
                          `(flymake-errline
                            ((((supports :underline (:style wave)))
                              (:underline (:style wave :color ,everblush-error)
                                          :inherit unspecified :foreground unspecified :background unspecified))
                             (t (:foreground ,everblush-error :weight bold :underline t))))
                          `(flymake-warnline
                            ((((supports :underline (:style wave)))
                              (:underline (:style wave :color ,everblush-warning)
                                          :inherit unspecified :foreground unspecified :background unspecified))
                             (t (:foreground ,everblush-warning :weight bold :underline t))))
                          `(flymake-infoline
                            ((((supports :underline (:style wave)))
                              (:underline (:style wave :color ,everblush-green)
                                          :inherit unspecified :foreground unspecified :background unspecified))
                             (t (:foreground ,everblush-bright-green :weight bold :underline t))))
                          `(flyspell-duplicate
                            ((((supports :underline (:style wave)))
                              (:underline (:style wave :color ,everblush-yellow) :inherit unspecified))
                             (t (:foreground ,everblush-yellow :weight bold :underline t))))
                          `(flyspell-incorrect
                            ((((supports :underline (:style wave)))
                              (:underline (:style wave :color ,everblush-red) :inherit unspecified))
                             (t (:foreground ,everblush-bright-red :weight bold :underline t))))
                          `(minibuffer-prompt ((t (:foreground ,everblush-yellow))))
                          `(menu ((t (:foreground ,everblush-fg :background ,everblush-bg))))
                          `(highlight ((t (:background ,everblush-highlight))))
                          `(hl-line-face ((,class (:background ,everblush-highlight))
                                          (t :weight bold)))
                          `(hl-line ((,class (:background ,everblush-highlight :extend t))
                                     (t :weight bold)))
                          `(success ((t (:foreground ,everblush-green :weight bold))))
                          `(warning ((t (:foreground ,everblush-warning :weight bold))))
                          `(error ((t  (:foreground ,everblush-error))))
                          `(tooltip ((t (:foreground ,everblush-fg :background ,everblush-black))))
                          `(region ((t (:inverse-video t :background ,everblush-black))))
                          `(secondary-selection ((t (:background ,everblush-bright-black))))
                          `(trailing-whitespace ((t (:background ,everblush-red))))
                          `(border ((t (:background ,everblush-bright-black :foreground ,everblush-white))))
                          `(vertical-border ((t (:foreground ,everblush-bright-black))))
                          `(mode-line ((t (:foreground ,everblush-white :background ,everblush-black :weight normal
                                                       :box (:line-width 1 :color ,everblush-black)))))
                          `(mode-line-inactive ((t (:foreground ,everblush-comment :background ,everblush-black :weight normal :box (:line-width 1 :color ,everblush-black)))))
                          `(mode-line-buffer-id ((t (:weight bold :background ,everblush-black :foreground ,everblush-bright-white))))
                          `(mode-line-emphasis ((t (:foreground ,everblush-fg :slant italic))))
                          `(mode-line-highlight ((t (:foreground ,everblush-magenta :box nil :weight bold))))
                          `(fringe ((t (:underline t :background ,everblush-bg :foreground ,everblush-highlight))))
                          `(fill-column-indicator ((,class :foreground ,everblush-highlight :weight semilight)))
                          `(linum ((t (:background ,everblush-black :foreground ,everblush-white))))
                          `(line-number ((t (:foreground ,(if everblush-distinct-line-numbers everblush-white everblush-comment)
                                                         ,@(when everblush-distinct-line-numbers
                                                             (list :background everblush-black))))))
                          `(line-number-current-line ((t (:inherit line-number :foreground ,(if everblush-distinct-line-numbers everblush-bright-white everblush-white)
                                                                   ,@(when everblush-distinct-line-numbers
                                                                       (list :background everblush-highlight))))))
                          `(header-line ((t (:foreground ,everblush-yellow
                                                         :background ,everblush-black
                                                         :box (:line-width -1 :style released-button)
                                                         :extend t))))
                          `(widget-field ((t (:foreground ,everblush-fg :background ,everblush-bright-black))))
                          `(widget-button ((t (:underline t))))
                          `(escape-glyph ((t (:foreground ,everblush-yellow :weight bold))))
                          `(dired-directory ((t (:weight bold :foreground ,everblush-blue))))
                          `(lazy-highlight ((t (:foreground ,everblush-blue :background ,everblush-bg :inverse-video t))))
                          `(isearch ((t (:inverse-video t :background ,everblush-highlight :foreground ,everblush-bright-blue))))
                          `(isearch-fail ((t (:background ,everblush-bg :inherit font-lock-warning-face :inverse-video t))))
                          `(isearch-lazy-highlight-face ((t (:inverse-video t :foreground ,everblush-yellow))))
                          `(grep-context-face ((t (:foreground ,everblush-fg))))
                          `(grep-error-face ((t (:foreground ,everblush-red :weight bold :underline t))))
                          `(grep-hit-face ((t (:foreground ,everblush-bright-blue))))
                          `(grep-match-face ((t (:foreground ,everblush-bright-blue :weight bold))))
                          `(match ((t (:background ,everblush-black :foreground ,everblush-bright-blue :weight bold))))
                          `(completions-annotations ((t (:foreground ,everblush-white))))
                          `(completions-common-part ((t (:foreground ,everblush-bright-blue))))
                          `(completions-first-difference ((t (:foreground ,everblush-bright-white))))
                          ;; ido
                          `(ido-first-match ((t (:foreground ,everblush-blue :weight bold))))
                          `(ido-only-match ((t (:foreground ,everblush-green :weight bold))))
                          `(ido-subdir ((t (:foreground ,everblush-yellow))))
                          `(ido-indicator ((t (:foreground ,everblush-yellow :background ,everblush-bright-red))))
                          ;; org-mode
                          `(org-agenda-date-today
                            ((t (:foreground ,everblush-fg :slant italic :weight bold))) t)
                          `(org-agenda-structure
                            ((t (:inherit font-lock-comment-face))))
                          `(org-archived ((t (:foreground ,everblush-fg :weight bold))))
                          `(org-block ((t (:background ,everblush-black :foreground ,everblush-white :extend t))))
                          `(org-block-begin-line ((t (:foreground ,everblush-comment :background ,everblush-black :extend t))))
                          `(org-code ((t (:foreground ,everblush-bright-yellow ))))
                          `(org-checkbox ((t (:background ,everblush-bg :foreground ,everblush-fg
                                                          :box (:line-width 1 :style released-button)))))
                          `(org-date ((t (:foreground ,everblush-blue :underline t))))
                          `(org-deadline-announce ((t (:foreground ,everblush-red))))
                          `(org-done ((t (:weight bold :weight bold :foreground ,everblush-green))))
                          `(org-formula ((t (:foreground ,everblush-yellow))))
                          `(org-headline-done ((t (:foreground ,everblush-green))))
                          `(org-hide ((t (:background ,everblush-bg :foreground ,everblush-bg))))
                          `(org-verbatim ((t (:foreground ,everblush-bright-yellow))))
                          `(org-meta-line ((t (:foreground ,everblush-comment))))
                          `(org-indent ((t (:background ,everblush-bg :foreground ,everblush-bg))))
                          `(org-level-1 ((t (:inherit ,z-variable-pitch :foreground ,everblush-bright-blue
                                                      ,@(when everblush-scale-org-headlines
                                                          (list :height everblush-height-plus-6))))))
                          `(org-level-2 ((t (:inherit ,z-variable-pitch :foreground ,everblush-bright-green
                                                      ,@(when everblush-scale-org-headlines
                                                          (list :height everblush-height-plus-5))))))
                          `(org-level-3 ((t (:inherit ,z-variable-pitch :foreground ,everblush-bright-magenta
                                                      ,@(when everblush-scale-org-headlines
                                                          (list :height everblush-height-plus-4))))))
                          `(org-level-4 ((t (:inherit ,z-variable-pitch :foreground ,everblush-bright-red
                                                      ,@(when everblush-scale-org-headlines
                                                          (list :height everblush-height-plus-3))))))
                          `(org-level-5 ((t (:inherit ,z-variable-pitch :foreground ,everblush-blue
                                                      ,@(when everblush-scale-org-headlines
                                                          (list :height everblush-height-plus-2))))))
                          `(org-level-6 ((t (:inherit ,z-variable-pitch :foreground ,everblush-green
                                                      ,@(when everblush-scale-org-headlines
                                                          (list :height everblush-height-plus-1))))))
                          `(org-level-7 ((t (:inherit ,z-variable-pitch :foreground ,everblush-magenta))))
                          `(org-level-8 ((t (:inherit ,z-variable-pitch :foreground ,everblush-red))))
                          `(org-link ((t (:foreground ,everblush-blue :underline t))))
                          `(org-scheduled ((t (:foreground ,everblush-green))))
                          `(org-scheduled-previously ((t (:foreground ,everblush-red))))
                          `(org-scheduled-today ((t (:foreground ,everblush-blue))))
                          `(org-sexp-date ((t (:foreground ,everblush-blue :underline t))))
                          `(org-special-keyword ((t (:inherit font-lock-comment-face))))
                          `(org-table ((t (:foreground ,everblush-blue))))
                          `(org-tag ((t (:weight bold :weight bold))))
                          `(org-time-grid ((t (:foreground ,everblush-yellow))))
                          `(org-todo ((t (:weight bold :foreground ,everblush-red :weight bold))))
                          `(org-upcoming-deadline ((t (:inherit font-lock-keyword-face))))
                          `(org-warning ((t (:weight bold :foreground ,everblush-error :weight bold :underline nil))))
                          `(org-column ((t (:background ,everblush-bg))))
                          `(org-column-title ((t (:background ,everblush-bg :underline t :weight bold))))
                          `(org-mode-line-clock ((t (:foreground ,everblush-fg :background ,everblush-bg))))
                          `(org-mode-line-clock-overrun ((t (:foreground ,everblush-bg :background ,everblush-red))))
                          `(org-ellipsis ((t (:foreground ,everblush-yellow :underline t))))
                          `(org-footnote ((t (:foreground ,everblush-cyan :underline t))))
                          `(org-document-title ((t (:inherit ,z-variable-pitch :foreground ,everblush-bright-blue
                                                             :weight bold
                                                             ,@(when everblush-scale-org-headlines
                                                                 (list :height everblush-height-plus-4))))))
                          `(org-document-info ((t (:foreground ,everblush-magenta))))
                          `(org-document-info-keyword ((t (:foreground ,everblush-comment))))
                          `(org-habit-ready-face ((t :background ,everblush-green)))
                          `(org-habit-alert-face ((t :background ,everblush-yellow :foreground ,everblush-bg)))
                          `(org-habit-clear-face ((t :background ,everblush-blue)))
                          `(org-habit-overdue-face ((t :background ,everblush-red)))
                          `(org-habit-clear-future-face ((t :background ,everblush-blue)))
                          `(org-habit-ready-future-face ((t :background ,everblush-green)))
                          `(org-habit-alert-future-face ((t :background ,everblush-yellow :foreground ,everblush-bg)))
                          `(org-habit-overdue-future-face ((t :background ,everblush-red)))
                          ;; org-ref
                          `(org-ref-ref-face ((t :underline t)))
                          `(org-ref-label-face ((t :underline t)))
                          `(org-ref-cite-face ((t :underline t)))
                          `(org-ref-glossary-face ((t :underline t)))
                          `(org-ref-acronym-face ((t :underline t)))
                          ;; flycheck
                          `(flycheck-error
                            ((((supports :underline (:style wave)))
                              (:underline (:style wave :color ,everblush-error) :inherit unspecified))
                             (t (:foreground ,everblush-error :weight bold :underline t))))
                          `(flycheck-warning
                            ((((supports :underline (:style wave)))
                              (:underline (:style wave :color ,everblush-warning) :inherit unspecified))
                             (t (:foreground ,everblush-warning :weight bold :underline t))))
                          `(flycheck-info
                            ((((supports :underline (:style wave)))
                              (:underline (:style wave :color ,everblush-cyan) :inherit unspecified))
                             (t (:foreground ,everblush-cyan :weight bold :underline t))))
                          `(flycheck-fringe-error ((t (:foreground ,everblush-error :weight bold))))
                          `(flycheck-fringe-warning ((t (:foreground ,everblush-warning :weight bold))))
                          `(flycheck-fringe-info ((t (:foreground ,everblush-cyan :weight bold))))
                          ;; company-mode
                          `(company-tooltip ((t (:foreground ,everblush-fg :background ,everblush-black))))
                          `(company-tooltip-annotation ((t (:foreground ,everblush-blue :background ,everblush-black))))
                          `(company-tooltip-annotation-selection ((t (:foreground ,everblush-blue :background ,everblush-black))))
                          `(company-tooltip-selection ((t (:foreground ,everblush-bright-white :background ,everblush-highlight))))
                          `(company-tooltip-mouse ((t (:background ,everblush-black))))
                          `(company-tooltip-common ((t (:foreground ,everblush-green))))
                          `(company-tooltip-common-selection ((t (:foreground ,everblush-green))))
                          `(company-scrollbar-fg ((t (:background ,everblush-black))))
                          `(company-scrollbar-bg ((t (:background ,everblush-bright-black))))
                          `(company-preview ((t (:background ,everblush-bright-green))))
                          `(company-preview-common ((t (:foreground ,everblush-bright-green :background ,everblush-black))))
                          ;; term, ansi-term, vterm
                          `(term-color-black ((t (:foreground ,everblush-bg
                                                              :background , everblush-bg))))
                          `(term-color-red ((t (:foreground ,everblush-red
                                                            :background ,everblush-bright-red))))
                          `(term-color-green ((t (:foreground ,everblush-green
                                                              :background ,everblush-bright-green))))
                          `(term-color-yellow ((t (:foreground ,everblush-yellow
                                                               :background ,everblush-bright-yellow))))
                          `(term-color-blue ((t (:foreground ,everblush-blue
                                                             :background ,everblush-bright-blue))))
                          `(term-color-magenta ((t (:foreground ,everblush-magenta
                                                                :background ,everblush-bright-magenta))))
                          `(term-color-cyan ((t (:foreground ,everblush-cyan
                                                             :background ,everblush-bright-cyan))))
                          `(term-color-white ((t (:foreground ,everblush-fg
                                                              :background ,everblush-fg))))
                          '(term-default-fg-color ((t (:inherit everblush-fg))))
                          '(term-default-bg-color ((t (:inherit everblush-bg))))
                          ;; diff-mode
                          `(diff-added ((t (:foreground ,everblush-bright-green :background: ,everblush-black :extend t))))
                          `(diff-changed ((t  (:foreground ,everblush-warning :background: ,everblush-black :extend t))))
                          `(diff-removed ((t (:foreground ,everblush-error :background: ,everblush-black :extend t))))
                          `(diff-indicator-added ((t (:inherit diff-added))))
                          `(diff-indicator-changed ((t (:inherit diff-changed))))
                          `(diff-indicator-removed ((t (:inherit diff-removed))))
                          `(diff-refine-added   ((t (:background ,everblush-bright-green :foreground ,everblush-black))))
                          `(diff-refine-changed ((t (:background ,everblush-warning :foreground ,everblush-black))))
                          `(diff-refine-removed ((t (:background ,everblush-error :foreground ,everblush-black))))
                          `(diff-header ((,class (:background ,everblush-black))
                                         (t (:background ,everblush-fg :foreground ,everblush-bg))))
                          `(diff-file-header
                            ((,class (:background ,everblush-black :foreground ,everblush-fg :weight bold))
                             (t (:background ,everblush-fg :foreground ,everblush-bg :weight bold))))
                          ;; diff-hl
                          `(diff-hl-change ((,class (:inverse-video t :foreground ,everblush-warning :background ,everblush-bg))))
                          `(diff-hl-delete ((,class (:inverse-video t :foreground ,everblush-error :background ,everblush-bg))))
                          `(diff-hl-insert ((,class (:inverse-video t :foreground ,everblush-bright-green :background ,everblush-bg))))
                          ;; tab-bar
                          `(tab-bar ((t (:height 1.1 :foreground ,everblush-white :background ,everblush-black))))
                          `(tab-bar-tab ((t (:background ,everblush-black
                                                         :foreground ,everblush-magenta
                                                         :box (:line-width 1 :style released-button)))))
                          `(tab-bar-tab-inactive ((t (:inherit tab-bar-tab
                                                               :background ,everblush-black
                                                               :foreground ,everblush-comment))))

                          ;; tab-line
                          `(tab-line ((t (:foreground ,everblush-white :background ,everblush-black))))
                          `(tab-line-close-highlight ((t (:foreground ,everblush-red))))
                          `(tab-line-tab ((t (:background ,everblush-black
                                                          :foreground ,everblush-magenta
                                                          :box (:line-width 1 :style released-button)))))
                          `(tab-line-tab-inactive ((t (:inherit tab-line-tab
                                                                :background ,everblush-black
                                                                :foreground ,everblush-comment))))
                          ;; vertico
                          `(vertico-current ((t (:background ,everblush-black :foreground ,everblush-yellow :weight bold))))
                          `(vertico-multiline ((t (:foreground ,everblush-green :weight bold))))
                          `(vertico-group-title ((t (:foreground ,everblush-green :weight bold))))
                          `(vertico-group-separator ((t (:foreground ,everblush-green :weight bold))))
                          ;; selectrum
                          `(selectrum-current-candidate ((t (:background ,everblush-black :foreground ,everblush-yellow :weight bold))))
                          `(selectrum-primary-highlight ((t (:foreground ,everblush-blue :weight bold))))
                          `(selectrum-secondary-highlight ((t (:foreground ,everblush-magenta :weight bold))))
                          ;; orderless
                          `(orderless-match-face-0 ((t (:foreground ,everblush-blue))))
                          `(orderless-match-face-1 ((t (:foreground ,everblush-magenta))))
                          `(orderless-match-face-2 ((t (:foreground ,everblush-green))))
                          `(orderless-match-face-3 ((t (:foreground ,everblush-cyan))))
                          ;; helm
                          `(helm-header
                            ((t (:foreground ,everblush-green
                                             :background ,everblush-bg
                                             :underline nil
                                             :box nil
                                             :extend t))))
                          `(helm-source-header
                            ((t (:foreground ,everblush-yellow
                                             :background ,everblush-black
                                             :underline nil
                                             :weight bold
                                             :box (:line-width -1 :style released-button)
                                             :extend t))))
                          `(helm-selection ((t (:background ,everblush-black :weight bold :underline nil))))
                          `(helm-selection-line ((t (:background ,everblush-black))))
                          `(helm-visible-mark ((t (:foreground ,everblush-bg :background ,everblush-bright-yellow))))
                          `(helm-candidate-number ((t (:foreground ,everblush-green :background ,everblush-black))))
                          `(helm-separator ((t (:foreground ,everblush-red :background ,everblush-bg))))
                          `(helm-time-zone-current ((t (:foreground ,everblush-green :background ,everblush-bg))))
                          `(helm-time-zone-home ((t (:foreground ,everblush-red :background ,everblush-bg))))
                          `(helm-bookmark-addressbook ((t (:foreground ,everblush-yellow :background ,everblush-bg))))
                          `(helm-bookmark-directory ((t (:foreground nil :background nil :inherit helm-ff-directory))))
                          `(helm-bookmark-file ((t (:foreground nil :background nil :inherit helm-ff-file))))
                          `(helm-bookmark-gnus ((t (:foreground ,everblush-magenta :background ,everblush-bg))))
                          `(helm-bookmark-info ((t (:foreground ,everblush-green :background ,everblush-bg))))
                          `(helm-bookmark-man ((t (:foreground ,everblush-yellow :background ,everblush-bg))))
                          `(helm-bookmark-w3m ((t (:foreground ,everblush-magenta :background ,everblush-bg))))
                          `(helm-buffer-not-saved ((t (:foreground ,everblush-red :background ,everblush-bg))))
                          `(helm-buffer-process ((t (:foreground ,everblush-cyan :background ,everblush-bg))))
                          `(helm-buffer-saved-out ((t (:foreground ,everblush-fg :background ,everblush-bg))))
                          `(helm-buffer-size ((t (:foreground ,everblush-white :background ,everblush-bg))))
                          `(helm-ff-directory ((t (:foreground ,everblush-cyan :background ,everblush-bg :weight bold))))
                          `(helm-ff-file ((t (:foreground ,everblush-fg :background ,everblush-bg :weight normal))))
                          `(helm-ff-file-extension ((t (:foreground ,everblush-fg :background ,everblush-bg :weight normal))))
                          `(helm-ff-executable ((t (:foreground ,everblush-green :background ,everblush-bg :weight normal))))
                          `(helm-ff-invalid-symlink ((t (:foreground ,everblush-red :background ,everblush-bg :weight bold))))
                          `(helm-ff-symlink ((t (:foreground ,everblush-yellow :background ,everblush-bg :weight bold))))
                          `(helm-ff-prefix ((t (:foreground ,everblush-bg :background ,everblush-yellow :weight normal))))
                          `(helm-grep-cmd-line ((t (:foreground ,everblush-cyan :background ,everblush-bg))))
                          `(helm-grep-file ((t (:foreground ,everblush-fg :background ,everblush-bg))))
                          `(helm-grep-finish ((t (:foreground ,everblush-green :background ,everblush-bg))))
                          `(helm-grep-lineno ((t (:foreground ,everblush-white :background ,everblush-bg))))
                          `(helm-grep-match ((t (:foreground nil :background nil :inherit helm-match))))
                          `(helm-grep-running ((t (:foreground ,everblush-red :background ,everblush-bg))))
                          `(helm-match ((t (:foreground ,everblush-yellow :background ,everblush-black :weight bold))))
                          `(helm-match-item ((t (:foreground ,everblush-yellow :background ,everblush-black :weight bold))))
                          `(helm-moccur-buffer ((t (:foreground ,everblush-cyan :background ,everblush-bg))))
                          `(helm-mu-contacts-address-face ((t (:foreground ,everblush-white :background ,everblush-bg))))
                          `(helm-mu-contacts-name-face ((t (:foreground ,everblush-fg :background ,everblush-bg))))
                          ;; ivy
                          `(ivy-confirm-face ((t (:foreground ,everblush-green :background ,everblush-bg))))
                          `(ivy-current-match ((t (:foreground ,everblush-yellow :background ,everblush-black :weight bold))))
                          `(ivy-cursor ((t (:foreground ,everblush-bg :background ,everblush-fg))))
                          `(ivy-match-required-face ((t (:foreground ,everblush-red :background ,everblush-bg :weight bold))))
                          `(ivy-minibuffer-match-face-1 ((t (:foreground ,everblush-magenta :weight bold ))))
                          `(ivy-minibuffer-match-face-2 ((t (:foreground ,everblush-blue :weight bold))))
                          `(ivy-minibuffer-match-face-3 ((t (:foreground ,everblush-green :weight bold))))
                          `(ivy-minibuffer-match-face-4 ((t (:foreground ,everblush-cyan :weight bold))))
                          `(ivy-remote ((t (:foreground ,everblush-blue :background ,everblush-bg))))
                          `(ivy-subdir ((t (:foreground ,everblush-yellow :background ,everblush-bg))))
                          ;; swiper
                          `(swiper-line-face ((t (:background ,everblush-highlight))))
                          ;; helpful
                          `(helpful-heading ((t (:foreground ,everblush-bright-green :height 1.2))))
                          ;; which function
                          `(which-func ((t (:foreground ,everblush-blue))))
                          ;; rainbow-delimiters
                          `(rainbow-delimiters-depth-1-face ((t (:foreground ,everblush-bright-blue))))
                          `(rainbow-delimiters-depth-2-face ((t (:foreground ,everblush-bright-green))))
                          `(rainbow-delimiters-depth-3-face ((t (:foreground ,everblush-bright-magenta))))
                          `(rainbow-delimiters-depth-4-face ((t (:foreground ,everblush-bright-yellow))))
                          `(rainbow-delimiters-depth-5-face ((t (:foreground ,everblush-bright-red))))
                          `(rainbow-delimiters-depth-6-face ((t (:foreground ,everblush-bright-cyan))))
                          `(rainbow-delimiters-depth-7-face ((t (:foreground ,everblush-blue))))
                          `(rainbow-delimiters-depth-8-face ((t (:foreground ,everblush-green))))
                          `(rainbow-delimiters-depth-9-face ((t (:foreground ,everblush-magenta))))
                          `(rainbow-delimiters-depth-10-face ((t (:foreground ,everblush-yellow))))
                          `(rainbow-delimiters-depth-11-face ((t (:foreground ,everblush-red))))
                          `(rainbow-delimiters-depth-12-face ((t (:foreground ,everblush-cyan))))
                          ;; gnus
                          `(gnus-group-mail-1 ((t (:weight bold :inherit gnus-group-mail-1-empty))))
                          `(gnus-group-mail-1-empty ((t (:inherit gnus-group-news-1-empty))))
                          `(gnus-group-mail-2 ((t (:weight bold :inherit gnus-group-mail-2-empty))))
                          `(gnus-group-mail-2-empty ((t (:inherit gnus-group-news-2-empty))))
                          `(gnus-group-mail-3 ((t (:weight bold :inherit gnus-group-mail-3-empty))))
                          `(gnus-group-mail-3-empty ((t (:inherit gnus-group-news-3-empty))))
                          `(gnus-group-mail-low ((t (:weight bold :inherit gnus-group-mail-low-empty))))
                          `(gnus-group-mail-low-empty ((t (:inherit gnus-group-news-low-empty))))
                          `(gnus-group-news-1 ((t (:weight bold :inherit gnus-group-news-1-empty))))
                          `(gnus-group-news-2 ((t (:weight bold :inherit gnus-group-news-2-empty))))
                          `(gnus-group-news-3 ((t (:weight bold :inherit gnus-group-news-3-empty))))
                          `(gnus-group-news-4 ((t (:weight bold :inherit gnus-group-news-4-empty))))
                          `(gnus-group-news-5 ((t (:weight bold :inherit gnus-group-news-5-empty))))
                          `(gnus-group-news-6 ((t (:weight bold :inherit gnus-group-news-6-empty))))
                          `(gnus-group-news-low ((t (:weight bold :inherit gnus-group-news-low-empty))))
                          `(gnus-header-content ((t (:inherit message-header-other))))
                          `(gnus-header-from ((t (:inherit message-header-other))))
                          `(gnus-header-name ((t (:inherit message-header-name))))
                          `(gnus-header-newsgroups ((t (:inherit message-header-other))))
                          `(gnus-header-subject ((t (:inherit message-header-subject))))
                          `(gnus-summary-cancelled ((t (:foreground ,everblush-yellow))))
                          `(gnus-summary-high-ancient ((t (:foreground ,everblush-blue :weight bold))))
                          `(gnus-summary-high-read ((t (:foreground ,everblush-green :weight bold))))
                          `(gnus-summary-high-ticked ((t (:foreground ,everblush-yellow :weight bold))))
                          `(gnus-summary-high-unread ((t (:foreground ,everblush-fg :weight bold))))
                          `(gnus-summary-low-ancient ((t (:foreground ,everblush-blue))))
                          `(gnus-summary-low-read ((t (:foreground ,everblush-green))))
                          `(gnus-summary-low-ticked ((t (:foreground ,everblush-yellow))))
                          `(gnus-summary-low-unread ((t (:foreground ,everblush-fg))))
                          `(gnus-summary-normal-ancient ((t (:foreground ,everblush-blue))))
                          `(gnus-summary-normal-read ((t (:foreground ,everblush-green))))
                          `(gnus-summary-normal-ticked ((t (:foreground ,everblush-yellow))))
                          `(gnus-summary-normal-unread ((t (:foreground ,everblush-fg))))
                          `(gnus-summary-selected ((t (:foreground ,everblush-yellow :weight bold))))
                          `(gnus-cite-1 ((t (:foreground ,everblush-blue))))
                          `(gnus-cite-2 ((t (:foreground ,everblush-blue))))
                          `(gnus-cite-3 ((t (:foreground ,everblush-blue))))
                          `(gnus-cite-4 ((t (:foreground ,everblush-green))))
                          `(gnus-cite-5 ((t (:foreground ,everblush-green))))
                          `(gnus-cite-6 ((t (:foreground ,everblush-green))))
                          `(gnus-cite-7 ((t (:foreground ,everblush-red))))
                          `(gnus-cite-8 ((t (:foreground ,everblush-red))))
                          `(gnus-cite-9 ((t (:foreground ,everblush-red))))
                          `(gnus-cite-10 ((t (:foreground ,everblush-yellow))))
                          `(gnus-cite-11 ((t (:foreground ,everblush-yellow))))
                          `(gnus-group-news-1-empty ((t (:foreground ,everblush-yellow))))
                          `(gnus-group-news-2-empty ((t (:foreground ,everblush-green))))
                          `(gnus-group-news-3-empty ((t (:foreground ,everblush-green))))
                          `(gnus-group-news-4-empty ((t (:foreground ,everblush-blue))))
                          `(gnus-group-news-5-empty ((t (:foreground ,everblush-blue))))
                          `(gnus-group-news-6-empty ((t (:foreground ,everblush-bright-blue))))
                          `(gnus-group-news-low-empty ((t (:foreground ,everblush-comment))))
                          `(gnus-signature ((t (:foreground ,everblush-yellow))))
                          `(gnus-x-face ((t (:background ,everblush-bg :foreground ,everblush-comment))))
                          ;; shr
                          `(shr-h1 ((t (:inherit ,z-variable-pitch :foreground ,everblush-bright-blue
                                                 ,@(when everblush-scale-shr-headlines
                                                     (list :height everblush-height-plus-6))))))
                          `(shr-h2 ((t (:inherit ,z-variable-pitch :foreground ,everblush-bright-green
                                                 ,@(when everblush-scale-shr-headlines
                                                     (list :height everblush-height-plus-5))))))
                          `(shr-h3 ((t (:inherit ,z-variable-pitch :foreground ,everblush-bright-magenta
                                                 ,@(when everblush-scale-shr-headlines
                                                     (list :height everblush-height-plus-4))))))
                          `(shr-h4 ((t (:inherit ,z-variable-pitch :foreground ,everblush-bright-red
                                                 ,@(when everblush-scale-shr-headlines
                                                     (list :height everblush-height-plus-3))))))
                          `(shr-h5 ((t (:inherit ,z-variable-pitch :foreground ,everblush-blue
                                                 ,@(when everblush-scale-shr-headlines
                                                     (list :height everblush-height-plus-2))))))
                          `(shr-h6 ((t (:inherit ,z-variable-pitch :foreground ,everblush-green
                                                 ,@(when everblush-scale-shr-headlines
                                                     (list :height everblush-height-plus-1))))))
                          `(shr-code ((t (:foreground ,everblush-bright-yellow ))))
                          `(shr-link ((t (:inherit link))))
                          `(shr-selected-link ((t (:inherit link-visited))))
                          ;; message
                          `(message-cited-text ((t (:inherit font-lock-comment-face))))
                          `(message-header-name ((t (:foreground ,everblush-comment))))
                          `(message-header-other ((t (:foreground ,everblush-magenta))))
                          `(message-header-to ((t (:foreground ,everblush-yellow :weight bold))))
                          `(message-header-cc ((t (:foreground ,everblush-yellow :weight bold))))
                          `(message-header-newsgroups ((t (:foreground ,everblush-yellow :weight bold))))
                          `(message-header-subject ((t (:foreground ,everblush-bright-blue :weight bold))))
                          `(message-header-xheader ((t (:foreground ,everblush-magenta))))
                          `(message-mml ((t (:foreground ,everblush-yellow :weight bold))))
                          `(message-separator ((t (:inherit font-lock-comment-face))))
                          `(message-cited-text-1 ((t (:foreground ,everblush-blue))))
                          `(message-cited-text-2 ((t (:foreground ,everblush-green))))
                          `(message-cited-text-3 ((t (:foreground ,everblush-yellow))))
                          `(message-cited-text-4 ((t (:foreground ,everblush-red))))
                          `(mm-uu-extract ((t (:background ,everblush-black :foreground ,everblush-bright-green))))
                          ;; notmuch
                          `(notmuch-crypto-decryption ((t (:foreground ,everblush-bg :background ,everblush-magenta))))
                          `(notmuch-crypto-part-header ((t (:foreground ,everblush-bright-blue))))
                          `(notmuch-crypto-signature-bad ((t (:foreground ,everblush-bg :background ,everblush-error))))
                          `(notmuch-crypto-signature-good ((t (:foreground ,everblush-bg :background ,everblush-green))))
                          `(notmuch-crypto-signature-good-key ((t (:foreground ,everblush-bg :background ,everblush-yellow))))
                          `(notmuch-crypto-signature-unknown ((t (:foreground ,everblush-bg :background ,everblush-error))))
                          `(notmuch-hello-logo-background ((t (:background ,everblush-black))))
                          `(notmuch-wash-cited-text ((t (:foreground ,everblush-cyan))))
                          `(notmuch-tag-face ((t (:foreground ,everblush-yellow))))
                          `(notmuch-tag-unread ((t (:foreground ,everblush-magenta))))
                          `(notmuch-tag-added ((t (:underline ,everblush-green))))
                          `(notmuch-tag-deleted ((t (:strike-through ,everblush-red))))
                          `(notmuch-tag-flagged ((t (:foreground ,everblush-blue))));
                          `(notmuch-message-summary-face ((t (:inherit highlight))))
                          `(notmuch-search-date ((t (:inherit default))))
                          `(notmuch-search-count ((t (:inherit default))))
                          `(notmuch-search-subject ((t (:inherit default))))
                          `(notmuch-search-matching-authors ((t (:inherit default))))
                          `(notmuch-search-non-matching-authors ((t (:inherit shadow))))
                          `(notmuch-search-flagged-face ((t (:foreground ,everblush-blue))))
                          `(notmuch-search-unread-face ((t (:weight bold))))
                          `(notmuch-tree-match-author-face ((t (:foreground ,everblush-blue))))
                          `(notmuch-tree-match-date-face ((t (:foreground ,everblush-yellow))))
                          `(notmuch-tree-match-tag-face ((t (:foreground ,everblush-cyan))))
                          `(notmuch-tree-no-match-face ((t (:inherit font-lock-comment-face))))
                          ;; mu4e
                          `(mu4e-unread-face ((t (:foreground ,everblush-green :weight normal))))
                          `(mu4e-replied-face ((t (:foreground ,everblush-comment))))
                          `(mu4e-flagged-face ((t (:foreground ,everblush-blue :weight normal))))
                          `(mu4e-warning-face ((t (:foreground ,everblush-red :slant normal :weight bold))))
                          `(mu4e-trashed-face ((t (:foreground ,everblush-comment :strike-through t))))
                          `(mu4e-cited-1-face ((t (:foreground ,everblush-bright-blue :slant italic :weight normal))))
                          `(mu4e-cited-2-face ((t (:foreground ,everblush-bright-green :slant italic :weight normal))))
                          `(mu4e-cited-3-face ((t (:foreground ,everblush-bright-magenta :slant italic :weight normal))))
                          `(mu4e-cited-4-face ((t (:foreground ,everblush-bright-red :slant italic :weight normal))))
                          `(mu4e-cited-5-face ((t (:foreground ,everblush-blue :slant italic :weight normal))))
                          `(mu4e-cited-6-face ((t (:foreground ,everblush-green :slant italic :weight normal))))
                          `(mu4e-cited-7-face ((t (:foreground ,everblush-magenta :slant italic :weight normal))))
                          `(mu4e-view-url-number-face ((t (:foreground ,everblush-yellow :weight normal))))
                          `(mu4e-header-highlight-face
                            ((t (,@(and (>= emacs-major-version 27) '(:extend t))
                                 :inherit unspecified
                                 :foreground unspecified :background ,everblush-bg
                                 :underline unspecified  :weight unspecified))))
                          `(mu4e-view-contact-face ((t (:foreground ,everblush-fg  :weight normal))))
                          `(mu4e-view-header-key-face ((t (:inherit message-header-name :weight normal))))
                          `(mu4e-view-header-value-face ((t (:foreground ,everblush-cyan :weight normal :slant normal))))
                          `(mu4e-view-link-face ((t (:inherit link))))
                          `(mu4e-view-special-header-value-face ((t (:foreground ,everblush-blue :weight normal :underline nil))))))

;;;###autoload
(and load-file-name
     (boundp 'everblush-load-path)
     (add-to-list 'everblush-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'everblush)

;; Local Variables:
;; indent-tabs-mode: nil
;; End:
;;; everblush.el ends here
