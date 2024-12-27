# Demo Page

Μπορείτε να κατεβάσετε τοπικά ή να επισκευτείτε την σελίδα: 
https://users.it.teithe.gr/~iee2019135/www/index.html



# Εγκατάσταση

## Απαιτήσεις

* Apache2
* Mysql Server
* php

## Οδηγίες Εγκατάστασης

 * Κάντε clone το project σε κάποιον φάκελο <br/>
  `$ git clone https://github.com/iee-ihu-gr-course1941/ADISE24_Qwirkle.git`

 * Βεβαιωθείτε ότι ο φάκελος είναι προσβάσιμος από τον Apache Server. πιθανόν να χρειαστεί να καθορίσετε τις παρακάτω ρυθμίσεις.

 * Θα πρέπει να δημιουργήσετε στην Mysql την βάση με όνομα 'adise21' και να φορτώσετε σε αυτήν την βάση τα δεδομένα από το αρχείο schema.sql

 * Θα πρέπει να φτιάξετε το αρχείο lib/config_local.php το οποίο να περιέχει:
```
    <?php
	$DB_PASS = 'κωδικός';
	$DB_USER = 'όνομα χρήστη';
    ?>
```

# Περιγραφή Παιχνιδιού

Το Qwirkle παίζεται ως εξής: Το Qwirkle είναι ένα επιτραπέζιο παιχνίδι όπου οι παίκτες τοποθετούν πλακίδια σε γραμμές με βάση κοινά χρώματα ή σχήματα. Κάθε σειρά πρέπει είτε να έχει το ίδιο χρώμα με διαφορετικά σχήματα είτε το ίδιο σχήμα με διαφορετικά χρώματα. Οι παίκτες κερδίζουν πόντους για κάθε γραμμή που δημιουργούν ή επεκτείνουν. Κάθε γύρος τελειώνει με τον παίκτη να τραβά νέα πλακίδια για να έχει πάντα έξι. Το παιχνίδι ολοκληρώνεται όταν εξαντληθούν όλα τα πλακίδια και νικητής είναι ο παίκτης με τους περισσότερους πόντους.

Οι κανόνες είναι Στο Qwirkle, οι παίκτες ξεκινούν με 6 πλακίδια που διαθέτουν ένα από 6 σχήματα και ένα από 6 χρώματα. Στη σειρά τους, οι παίκτες τοποθετούν ένα ή περισσότερα πλακίδια στο τραπέζι, σχηματίζοντας γραμμές που ακολουθούν έναν από τους δύο κανόνες:

Όλα τα πλακίδια στη γραμμή πρέπει να έχουν ίδιο χρώμα και διαφορετικά σχήματα.
Όλα τα πλακίδια στη γραμμή πρέπει να έχουν ίδιο σχήμα και διαφορετικά χρώματα.
Οι παίκτες κερδίζουν πόντους για κάθε νέα ή επεκτεινόμενη γραμμή που δημιουργούν, ενώ μια ολοκληρωμένη σειρά 6 πλακιδίων (Qwirkle) δίνει 6 επιπλέον πόντους. Μετά τη σειρά τους, οι παίκτες τραβούν πλακίδια από τη στοίβα ώστε να έχουν ξανά 6 πλακίδια. Το παιχνίδι τελειώνει όταν δεν υπάρχουν άλλα πλακίδια για τράβηγμα και κάποιος παίκτης τοποθετήσει το τελευταίο του πλακίδιο. Ο παίκτης με τους περισσότερους πόντους κερδίζει.

Η βάση μας κρατάει τους εξής πίνακες και στοιχεία : Ο πινακας board αποθηκεύει την κατάσταση των κελιών του ταμπλό, περιλαμβάνοντας πληροφορίες για τις συντεταγμένες, το χρώμα και το σχήμα του πλακιδίου.
Ο πινακας board_empty βοηθαει στο αδειασμα του πινακα.
Ο πινακας game_status παρακολουθει την κατασταση και την προοδο του παιχνιδιου.
Ο πινακας players αποθηκεύει στοιχεία για τους παίκτες, όπως το όνομα, το χρώμα πλακιδίων και την τελευταία τους δραστηριότητα.



Η εφαρμογή απαπτύχθηκε μέχρι το σημείο : Αυτο που δεν αναπτυχθηκε ειναι το μετρημα των ποντων αναλογα με το παιξιμο που εκανε ο παιχτης

## Συντελεστές

Το project υλοποιηθηκε εξ ολοκλήρου απο τον Ηλια Παραφεστα 2019135


# Περιγραφή API

## Methods


### Board
#### Ανάγνωση Board

```
GET /board/
```

Επιστρέφει το [Board](#Board).

#### Αρχικοποίηση Board
```
POST /board/
```

Αρχικοποιεί το Board, δηλαδή το παιχνίδι. Γίνονται reset τα πάντα σε σχέση με το παιχνίδι.
Επιστρέφει το [Board](#Board).

### Piece
#### Ανάγνωση Θέσης/Πιονιού

```
GET /board/piece/:x/:y/
```

Κάνει την κίνηση του πιονιού από την θέση x,y στην νέα θέση. Προφανώς ελέγχεται η κίνηση αν είναι νόμιμη καθώς και αν είναι η σειρά του παίκτη να παίξει με βάση το token.
Επιστρέφει τα στοιχεία από το [Board](#Board-1) με συντεταγμένες x,y.
Περιλαμβάνει το χρώμα του πιονιού και τον τύπο.

#### Μεταβολή Θέσης Πιονιού

```
PUT /board/piece/:x/:y/
```
Json Data:

| Field             | Description                 | Required   |
| ----------------- | --------------------------- | ---------- |
| `x`               | Η νέα θέση x                | yes        |
| `y`               | Η νέα θέση y                | yes        |

Επιστρέφει τα στοιχεία από το [Board](#Board-1) με συντεταγμένες x,y.
Περιλαμβάνει το χρώμα του πιονιού και τον τύπο


### Player

#### Ανάγνωση στοιχείων παίκτη
```
GET /players/:p
```

Επιστρέφει τα στοιχεία του παίκτη p ή όλων των παικτών αν παραληφθεί. Το p μπορεί να είναι 'R' ή 'B'.

#### Καθορισμός στοιχείων παίκτη
```
PUT /players/:p
```
Json Data:

| Field             | Description                 | Required   |
| ----------------- | --------------------------- | ---------- |
| `username`        | Το username για τον παίκτη p. | yes        |
| `color`           | To χρώμα που επέλεξε ο παίκτης p. | yes        |


Επιστρέφει τα στοιχεία του παίκτη p και ένα token. Το token πρέπει να το χρησιμοποιεί ο παίκτης καθόλη τη διάρκεια του παιχνιδιού.

### Status

#### Ανάγνωση κατάστασης παιχνιδιού
```
GET /status/
```

Επιστρέφει το στοιχείο [Game_status](#Game_status).



## Entities


### Board
---------

Το board είναι ένας πίνακας, ο οποίος στο κάθε στοιχείο έχει τα παρακάτω:


| Attribute                | Description                                  | Values                              |
| ------------------------ | -------------------------------------------- | ----------------------------------- |
| `x`                      | H συντεταγμένη x του τετραγώνου              | 1..8                                |
| `y`                      | H συντεταγμένη y του τετραγώνου              | 1..8                                |
| `b_color`                | To χρώμα του τετραγώνου                      | 'W','W'                             |
| `piece_color`            | To χρώμα του πιονιού                         | 'R','O','Y','G','B','P', null       |
| `piece`                  | To Πιόνι που υπάρχει στο τετράγωνο           | 'C','4','D','S','8','CL', null      |



### Players
---------

O κάθε παίκτης έχει τα παρακάτω στοιχεία:


| Attribute                | Description                                  | Values                              |
| ------------------------ | -------------------------------------------- | ----------------------------------- |
| `username`               | Όνομα παίκτη                                 | String                              |
| `piece_color`            | To χρώμα που παίζει ο παίκτης                | 'R','B'                             |
| `token  `                | To κρυφό token του παίκτη. Επιστρέφεται μόνο τη στιγμή της εισόδου του παίκτη στο παιχνίδι | HEX |


### Game_status
---------

H κατάσταση παιχνιδιού έχει τα παρακάτω στοιχεία:


| Attribute                | Description                                  | Values                              |
| ------------------------ | -------------------------------------------- | ----------------------------------- |
| `status  `               | Κατάσταση             | 'not active', 'initialized', 'started', 'ended', 'aborded'     |
| `p_turn`                 | To χρώμα του παίκτη που παίζει        | 'R','B',null                              |
| `result`                 |  To χρώμα του παίκτη που κέρδισε |'R','B',null                              |
| `last_change`            | Τελευταία αλλαγή/ενέργεια στην κατάσταση του παιχνιδιού         | timestamp |
