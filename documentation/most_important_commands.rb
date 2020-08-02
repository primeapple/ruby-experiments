##############################
###########Ruby###############
##############################

# wichtige Shortcuts:
# Programm ausführen:	ruby programmname.rb
# Hilfe(z.B. für each):	ri .each
# Sandkasten: IRB		irb

#Grundsatz: ALLES ist ein Objekt

# <-- Kommentare

##############################
#Textausgabe

print "Hallo"
print "Hallo"
#=> HalloHallo

puts "Hallo"
puts "Hallo"
#=> Hallo
#=> Hallo













################################
#Methoden/Funktionen: 
def funktionsname
	anweisung
end


#Beispiel:
def print3times(a="test")
	puts a
	puts a
	puts a
end








################################
#Klassen
#Klassen werden wie folgt definiert:
#ACHTUNG: Klassennamen beginnen mit Großbuchstaben
class Dies_und_das
	def funktion
		anweisung
	end
end

#private Methoden:
class Dies_und_das
	private
	def private_funktion
		anweisung
	end
end



#Instanzen/Objekte erstellen: 
new_object = klassenname.new 
#.new ruft Konstruktor initialize auf:


class Dies_und_das
	def initialize(a) 
		puts a
	end
end



#Vererbung:
class Kindklasse < Elternklasse
	...
end





#Instanz/Klassenmethoden:

class Dies_und_das
	#Instanzmethode
	def hallo
		puts "Hallo"
	end
	
	#Klassenmethode
	def self.bye
		puts "Bye"
	end
end

test = Dies_und_das.new

test.hallo
#=> "Hallo"

Dies_und_das.bye
#=> "Bye"

#alles andere gibt einen Fehler


#Interessante Standardmethoden:


#Klasse.[instance_]methods(false) gibt eigene Methoden aus
#Klasse.[instance_]methods gibt alle Methoden aus

Dies_und_das.instance_methods(false)
#=> "hallo"

Dies_und_das.methods(false)
#=> "Bye"

test.class
#=> Dies_und_das
"Hallo".class
#=> String










#################################
#Variablen:

#ALLES ist ein Objekt
#Ausgabe von Variblen und Text:
erg=20
erg.class #=> Integer
erg*=5555555555
erg.class #=> Integer
puts "Ergebnis von langer Rechnung: #{erg}"
#analog:
puts "Ergebnis von langer Rechnung: " + a.to_s
#analog:
print "Ergebnis von langer Rechnung: ", a 

puts a #=> 111111111111110
#hier wird .to_s automatisch ausgeführt

#weiterhin:
true,false #Booleans
2.0 #Float

#Gültigkeitsbereich von Variablen:
a=5 #lokal definiert

$a=5 #globale Variablen

@a=5 #Instanzvariablen
#gelten nur innerhalb von Klassen, darin aber überall
#in Rails gibt es sehr viele Instanzvariablen, daher merken :)


#getter und setter Methoden: analog zu get_Variable, set_Variable in Java
#in Ruby kann man sich das sparen, siehe folgendes Bsp:

class Raum
	def initialize
		@tueren = 1
		@fenster = 1
	end
	
	def get_tueren
		tueren #man kann return weglasssen
	end

	def set_tueren(tuer)
		@tueren = tuer
	end

	def get_fenster
		fenster
	end

	def set_tueren(fenst)
		@fenster = fenster
	end
end

#vereinfacht zu:

class Raum
	def initialize
		@tueren = 1
		@fenster = 1
	end
	attr_accessor :tueren :fenster #Namen als Symbole gesetzt
end

bad=raum.new
puts bad.tueren #=> 1


#statt attr_reader gibt es noch attr_writer(für set Methoden)  und attr_accessor(für set und get Methoden)
#=> schnelle Codeerzeugung



######################
#If-then-else

if a==10 then
	puts "a ist 10"
elsif a==20 then
	puts "a ist 20"
else
	puts "a ist was anderes"
end

#kurzform:
puts "a ist 10" if a == 10
a==10? 1:2



######################
#Schleifen 

#WHILE/UNTIL SCHLEIFEN:

#solange
while BEDINGUNG do
	...
end

#bis
until BEDINGUNG do
	...
end

#ITERATOREN:

5.times { |i| print i }
#oder
5.times do |i|
	print i
end
#oder
0.upto(4) { |i|
	print i
}

#=> immer wird 01234 ausgegeben

#funktioniert auch ohne Iterator:

5.times { print 0}
#=> 00000




##############################
#Arrays
arr=["Test","Apfel"]
#es ist möglich verschiedene Objekte in Arrays zu speichern
arr=[2.0,4,"String"]
#Zugriff:
arr[2].class #=> Integer

#kein festes Array wie in Java, sondern eher Arraylist
arr = Array.new #=> []
arr << "erster Eintrag"
arr << 2
#=> ["erster Eintrag",2]
arr.length #=> 2
arr.count #=> 2
arr.size #=> 2
#und noch viele weitere Methoden...

#Iterator für Arrays: each
arr.each do |eintrag| #WICHTIG
	print eintrag, " "
end
#=>"erster Eintrag" 2 








############################
#Hashes
#Hashes sind Listen aus Schlüssel/Werte (key,value) Paaren
preisliste = {"Ei" => 1.0, "Brot" => 2.5, "Wurst" => 9}
preisliste["Brot"]
#=> 2.5

#meistens werden als keys keine Strings sonder Symbols genutzt
#Grund:
a = "Beispiel"
a.object_id
#=> 2312312312
a = "Test"
a.object_id
#=> 1231312312
a = "Test"
a.object_id
#=> 1231312320
b = "Test"
#=> b.object_id != a.object_id

#Speicherplatz und Geschwindigkeitsverlust, darum Verwendung von Symbols
"white".object_id #=> 23151438
"white".object_id #=> 23151296
"white".object_id #=> 23151217
:white.object_id #=>  23151235
:white.object_id #=>  23151235
:white.object_id #=>  23151235

require 'benchmark'
Benchmark.realtime{
	100000000.times { a=:white}
}

Benchmark.realtime{
	100000000.times { a="white"}
}

#darum werden als keys in Hashes immer Symbols verwendet
einkaufsliste {:kaese => 12, :butter => 2, :club_mate => 20}

einkaufsliste.each do |key,value|
	puts "Produkt: #{key} - Menge #{value}"
end

#=> Produkt: kaese - Menge 12
#=> Produkt: butter - Menge 2
#=> Produkt: club_mate - Menge 20


###########################
#Range

(-4..4).each { |i| print i}
#=> -4-3-2-101234

(-4...4).each { |i| print i}
#=> -4-3-2-10123

#Range zu Array machen:
("a".."d").to_a
#=> ["a","b","c","d"]

(0..4) == Range.new(0,4)
#=> true
