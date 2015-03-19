;;; package --- rust specific config
;;; Commentary:
;;; Code:
(require-package 'company)
(require-package 'rust-mode)

(setq racer-rust-src-path "/home/gchp/github.com/gchp/rust/src/")
(setq racer-cmd "/home/gchp/github.com/phildawes/racer/target/release/racer")
(add-to-list 'load-path "/home/gchp/github.com/phildawes/racer/editors")

(eval-after-load "rust-mode" '(require 'racer))

(provide 'init-rust)
;;; init-rust.el ends here
