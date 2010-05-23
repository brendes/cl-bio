
(asdf:defsystem #:cl-bio-test
  :name "cl-bio-test"
  :author "Cyrus Harmon <ch-lisp@bobobeach.com>"
  :version "0.2.7"
  :licence "BSD"
  :description "Tests for cl-bio"
  :depends-on (cl-bio)
  :components
  ((:module :test
	    :components
	    ((:cl-source-file "defpackage")
	     (:cl-source-file "cl-bio-test" :depends-on ("defpackage"))))
   (:module :data
	    :components
	    ((:static-file "dpp-fasta" :pathname #p"dpp.fasta")))))

