class Doctor
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def appointments
        Appointment.all.select {|appointment| appointment.doctor == self}
    end

    def new_appointment(date, patient)
        new_app = Appointment.new(date, patient, self)
        new_app
    end

    def patients
        appointments.map {|patient| patient.patient}
    end
end