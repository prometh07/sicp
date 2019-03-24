#lang sicp

; Now we do have three serialized procedures for each account:
; withdraw, deposit and exchange. The problem is that once we call exchange,
; our serializer won't allow any call to either deposit or withdraw procedures.
; With this implementation of make-account we can't create any serialized
; procedure that uses withdrawal/deposit operations.
