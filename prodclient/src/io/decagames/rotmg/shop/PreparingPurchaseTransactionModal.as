﻿//io.decagames.rotmg.shop.PreparingPurchaseTransactionModal

package io.decagames.rotmg.shop
{
    import io.decagames.rotmg.ui.popups.modal.TextModal;
    import io.decagames.rotmg.ui.buttons.BaseButton;

    public class PreparingPurchaseTransactionModal extends TextModal 
    {

        public function PreparingPurchaseTransactionModal()
        {
            super(300, "Payment", "Preparing transaction...", new Vector.<BaseButton>());
        }

    }
}//package io.decagames.rotmg.shop

