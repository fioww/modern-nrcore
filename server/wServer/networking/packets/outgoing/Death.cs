using common;

namespace wServer.networking.packets.outgoing
{
    public class Death : OutgoingMessage
    {
        public string AccountId { get; set; }
        public int CharId { get; set; }
        public string KilledBy { get; set; }
        public int ZombieId { get; set; }
        public int ZombieType { get; set; }

        public override PacketId ID => PacketId.DEATH;
        public override Packet CreateInstance() { return new Death(); }

        protected override void Write(NWriter wtr)
        {
            wtr.WriteUTF(AccountId);
            wtr.Write(CharId);
            wtr.WriteUTF(KilledBy);
            wtr.Write(ZombieType);
            wtr.Write(ZombieId);
        }
    }
}
