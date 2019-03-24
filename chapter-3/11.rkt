#lang sicp

; locall state for acc is kept in a separate frame
; [acc frame] -> global
; acc and acc2 are totally separate environments, having a common (global)
; parent frame. Besides that the only thing they can share is
; internal procedures code, but that is an implementation detail.
