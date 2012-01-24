
using System.Data.Common;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using Ivis4Mac.Model;

namespace Ivis4Mac
{

    public class Ivis4MacDataContext : DbContext
    {
        public Ivis4MacDataContext(DbConnection connections, bool contextOwnsConnection)
            : base(connections, contextOwnsConnection)
        {
        }


        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }

        public DbSet<Color> Colors { set; get; }
        public DbSet<ClothingItem> Ñlothes { set; get; }

        public DbSet<VolonteerCarType> CarTypes { set; get; }
        public DbSet<EquipmentType> EquipmentTypes { set; get; }
        public DbSet<Equipment> EquipmentItems { set; get; }
        public DbSet<Volonteer> Volonteers { set; get; }
        public DbSet<MissingPerson> MissingPeople { set; get; }
        public DbSet<PersonSignType> PersonSignTypes { set; get; }
        public DbSet<PersonSign> PersonSigns { set; get; }
        public DbSet<Person> People { set; get; }
        public DbSet<Contact> Contacts { set; get; }
        public DbSet<Address> Addresses { set; get; }
        public DbSet<Incident> Incidents { set; get; }
        public DbSet<PublicityType> PublicityTypes { set; get; }
        public DbSet<MapLink> MapLinks { set; get; }
        public DbSet<IncidentState> IncidentStates { set; get; }
        public DbSet<FileLink> File { set; get; }
        public DbSet<PoliceApplication> PoliceApplications { set; get; }
        public DbSet<PoliceRecordType> PoliceRecordTypes { set; get; }
        public DbSet<Document> Documents { set; get; }
        public DbSet<Organization> Organizations { set; get; }
        public DbSet<OrganizationType> OrganizationTypes { set; get; }

    }
}