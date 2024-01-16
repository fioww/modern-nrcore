using common;
using common.resources;

namespace wServer.networking.packets.outgoing
{
    public class Aoe : OutgoingMessage
    {
        public Position Pos { get; set; }
        public float Radius { get; set; }
        public ushort Damage { get; set; }
        public ConditionEffectIndex Effect { get; set; }
        public float Duration { get; set; }
        public ushort OrigType { get; set; }
        public uint Color = 0xff0000;
        public bool ArmorPierce;

        public override PacketId ID => PacketId.AOE;
        public override Packet CreateInstance() { return new Aoe(); }
        
        protected override void Write(NWriter wtr)
        {
            Pos.Write(wtr);
            wtr.Write(Radius);
            wtr.Write(Damage);
            wtr.Write((byte)Effect);
            wtr.Write(Duration);
            wtr.Write(OrigType);
            wtr.Write((int)Color);
            wtr.Write(ArmorPierce);
        }
    }
}
