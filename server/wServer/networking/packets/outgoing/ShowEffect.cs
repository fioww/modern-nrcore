using common;

namespace wServer.networking.packets.outgoing
{
    public class ShowEffect : OutgoingMessage
    {
        public EffectType EffectType;
        public int TargetObjectId;
        public Position Pos1;
        public Position Pos2;
        public float Duration;
        public ARGB Color;

        public override PacketId ID => PacketId.SHOWEFFECT;
        public override Packet CreateInstance() { return new ShowEffect(); }
        
        // bruh lol
        protected override void Write(NWriter wtr)
        {
            // setup flags
            byte flags = 0;
            if (!Color.IsDefault())
                flags |= 1 << 0;
            if (Pos1.X != default)
                flags |= 1 << 1;
            if (Pos1.Y != default)
                flags |= 1 << 2;
            if (Pos2.X != default)
                flags |= 1 << 3;
            if (Pos2.Y != default)
                flags |= 1 << 4;
            if (Duration != default)
                flags |= 1 << 5;
            if (TargetObjectId != default)
                flags |= 1 << 6;
            
            // write
            wtr.Write((byte)EffectType);
            wtr.Write(flags);
            if ((flags & 1 << 6) != 0)
                wtr.Write(TargetObjectId);
            if ((flags & 1 << 1) != 0)
                wtr.Write(Pos1.X);
            if ((flags & 1 << 2) != 0)
                wtr.Write(Pos1.Y);
            if ((flags & 1 << 3) != 0)
                wtr.Write(Pos2.X);
            if ((flags & 1 << 4) != 0)
                wtr.Write(Pos2.Y);
            if ((flags & 1 << 0) != 0)
                Color.Write(wtr);
            if ((flags & 1 << 5) != 0)
                wtr.Write(Duration);
        }
    }
}
