class Patient
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def appointments
        Appointment.all.select {|patient| patient.patient == self}
    end

    def doctors
        appointments.map {|appointent| appointent.doctor}
    end
    def new_appointment(doctor, date)
        Appointment.new(self, date, doctor)
    end
end