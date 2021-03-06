
(asdf:oos 'asdf:load-op :cl-bio)
(asdf:oos 'asdf:load-op :cl-bio-entrez)

(in-package :bio-user)

(defparameter *d* (make-random-dna-sequence 100))
(residues-string *d*)

(defparameter *dna-seq-1* (make-instance 'adjustable-dna-sequence))
(insert-residues *dna-seq-1* 0 "GAATTC")
(residues-string *dna-seq-1*)

(defparameter *df* (change-class (make-random-dna-sequence 1000)
                                 'adjustable-dna-sequence))

(defparameter *rf* (change-class (make-random-rna-sequence 100)
                                 'adjustable-rna-sequence))

(defparameter *af* (change-class (make-random-aa-sequence 100)
                                 'adjustable-aa-sequence))

(insert-residues *df* 0 "TTTT")
(insert-residues *rf* 0 "UUUU")
(insert-residues *af* 0 "HHHH")

(residues-string *df*)
(residues-string *rf*)
(residues-string *af*)
(seq-length *df*)

(bio:residue *df* 0)

(append-residues *df* "TTTT")
(append-residues *rf* "CUCU")
(append-residues *af* "YYYY")

(insert-residues *df* 1 "AAAA")

(flexichain:insert-vector* (bio::residues *df*) 
                           0
                           (map '(vector (unsigned-byte 2))
                                #'(lambda (x)
                                    (bio::char-to-seq-code *df* x))
                                "AAAAA"))

(slot-value (bio::residues *df*) 'flexichain::element-type)

(residues-string *df*)

(let ((r (make-instance 'range :start 10 :end 15)))
  (residues-string-range *df* r))

(defparameter *df2* (make-instance 'adjustable-dna-sequence))
(setf (residues-string *df2*) "AACCGG")
(residues-string *df2*)

(dna->rna (make-instance 'simple-dna-sequence :initial-contents "ATGCAGTAA"))

(defparameter *moose* (make-instance 'simple-aa-sequence :initial-contents "ASTRYWPQ"))

(translate (dna->rna (make-instance 'simple-dna-sequence :initial-contents "ATGCAGTAACCCTCTGGAGTC")))

(let ((dna (make-random-dna-sequence 200)))
  (list
   (residues-string dna)
   (residues-string (translate dna))
   (residues-string (translate dna :range (range 1 (seq-length dna))))
   (residues-string (translate dna :range (range 2 (seq-length dna))))))

(3-letter-residues-string
 (translate
  (make-instance 'simple-dna-sequence
                 :initial-contents "ATGCAGCAACCCTCTGGAGTCTAA")))

;;; bioperl example
(defparameter *seq*
  (make-dna-sequence-from-string "CATGTAGATAG"))
(add-descriptor *seq* (make-instance 'identifier :id "testseq"))
(format t "seq is ~A bases long~&" (seq-length *seq*))
(format t "revcomp seq is ~A~&" (residues-string (reverse-complement *seq*)))
(write-fasta-file *seq* "testseq.fsa")

