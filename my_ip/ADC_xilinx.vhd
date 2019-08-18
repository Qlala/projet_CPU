----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.11.2018 08:25:43
-- Design Name: 
-- Module Name: ADC_xilinx - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity ADC_xilinx_DRP_interface_module is
    Port ( ADC_out : in STD_LOGIC_VECTOR (12 downto 0);
           analog_P : in STD_LOGIC;
           analog_N : in STD_LOGIC;
           conv_EN : in STD_LOGIC;
           CHANNEL : std_logic_vector(4 downto 0);
           end_of_conv: out std_logic;
           end_of_seq : out std_logic;
           clk_sample : in STD_LOGIC;
           clk : in STD_LOGIC
           
           );
end ADC_xilinx_DRP_interface_module;

architecture ADC_xilinx_DRP_interface_module is
signal alarm_signals:std_logic_vector(7 downto 0);
begin
   XADC_inst : XADC
generic map (
   -- INIT_40 - INIT_42: XADC configuration registers
   INIT_40 => X"0000",--D0 to D3 => singe chanel mode
   --D8 => ACQ increase settling time in single channel
   --D9 => EC select continuous or event driven sampling : 1 => event, 0=> continuous
   --D10 => unipolar or bipolar : 1 => bipolar
   --D11 => MUX : 1 => enable extern multipler (MUXADDR)
   --D12 , D13 => AVG0,AVG1 : sample averaging
   --00=>0,01=>16,10=>64,11=>256
   --D15 : disable averaging for calibration => 1
   INIT_41 => X"0000",
   --D0 => disable OT =>1
   --D1 to D3 => disable ALM0 to ALM2
   --D4 to D7 => CAL0,CAL1,CAL2,CAL3 set to 1 to enable: CAL0 => offset correction
   --CAL1= correction offset et gain
   --CAL2=supply sensor offst correction
   --D8 => disable ALM3
   --D12 to D15 => SEQ0 to SEQ3 
   INIT_42 => X"0800",
   --D4 , D5 => ¨PD0,PD1 set to 1 to power down
   --D8 to D15 => set the clock division factor beteween DCLK and ADCCLK(the sampling clock)0 to 255
   -- INIT_48 - INIT_4F: Sequence Registers
   INIT_48 => X"0000",
   INIT_49 => X"0000",
   INIT_4A => X"0000",
   INIT_4B => X"0000",
   INIT_4C => X"0000",
   INIT_4D => X"0000",
   INIT_4F => X"0000",
   INIT_4E => X"0000",                 -- Sequence register 6
   -- INIT_50 - INIT_58, INIT5C: Alarm Limit Registers
   INIT_50 => X"0000",--temp upper ALM[0
   INIT_51 => X"0000",--VCCINt upper ALM[1]
   INIT_52 => X"0000",--VCCAUX uper ALM[2]
   INIT_53 => X"0000",-- OT alarm limit => OT
   INIT_54 => X"0000",--temp lower   
   INIT_55 => X"0000",--VCCINT lower   
   INIT_56 => X"0000",--VCCAUX lower        
   INIT_57 => X"0000",--OT alarm reset
   INIT_58 => X"0000",--VCCBRAM upper
   INIT_5C => X"0000",--VCCBRAM lower
   -- Simulation attributes: Set for proper simulation behavior
   SIM_DEVICE => "7SERIES",            -- Select target device (values)
   SIM_MONITOR_FILE => "design.txt"  -- Analog simulation data file name
)
port map (
   -- ALARMS: 8-bit (each) output: ALM, OT
   ALM => alarm_signals,                   -- 8-bit output: Output alarm for temp, Vccint, Vccaux and Vccbram
   OT => OT,                     -- 1-bit output: Over-Temperature alarm

   -- STATUS: 1-bit (each) output: XADC status ports
   BUSY => BUSY,                 -- 1-bit output: ADC busy output
   CHANNEL => CHANNEL,           -- 5-bit output: Channel selection outputs
   EOC => end_of_conv,                   -- 1-bit output: End of Conversion
   EOS => end_of_seq,                   -- 1-bit output: End of Sequence
   JTAGBUSY => open,         -- 1-bit output: JTAG DRP transaction in progress output -- no JTAG
   JTAGLOCKED => open,     -- 1-bit output: JTAG requested DRP port lock
   JTAGMODIFIED => open, -- 1-bit output: JTAG Write to the DRP has occurred
   MUXADDR => open,           -- 5-bit output: External MUX channel decode
   -- Auxiliary Analog-Input Pairs: 16-bit (each) input: VAUXP[15:0], VAUXN[15:0]
   VAUXN => VAUXN,               -- 16-bit input: N-side auxiliary analog input
   VAUXP => VAUXP,               -- 16-bit input: P-side auxiliary analog input
   -- CONTROL and CLOCK: 1-bit (each) input: Reset, conversion start and clock inputs
   CONVST => conv_en,             -- 1-bit input: Convert start input
   CONVSTCLK => clk_sample,       -- 1-bit input: Convert start input
   RESET => RESET,               -- 1-bit input: Active-high reset
   -- Dedicated Analog Input Pair: 1-bit (each) input: VP/VN
   VN => analog_N,                     -- 1-bit input: N-side analog input
   VP => analog_P,                     -- 1-bit input: P-side analog input
   -- Dynamic Reconfiguration Port (DRP): 16-bit (each) output: Dynamic Reconfiguration Ports
   DO => DO,                     -- 16-bit output: DRP output data bus
   DRDY => DRDY,                 -- 1-bit output: DRP data ready
   -- Dynamic Reconfiguration Port (DRP): 7-bit (each) input: Dynamic Reconfiguration Ports
   DADDR => DADDR,               -- 7-bit input: DRP address bus
   DCLK => DCLK,                 -- 1-bit input: DRP clock
   DEN => DEN,                   -- 1-bit input: DRP enable signal
   DI => DI,                     -- 16-bit input: DRP input data bus
   DWE => DWE                    -- 1-bit input: DRP write enable
);

-- End of XADC_inst instantiation

end Behavioral;
