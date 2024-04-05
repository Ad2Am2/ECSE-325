LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY sine_approximation_vhd_tst IS
END sine_approximation_vhd_tst;

ARCHITECTURE sine_approximation_arch OF sine_approximation_vhd_tst IS

    -- Constants declaration (if any)

    -- Signals declaration
    SIGNAL angle : unsigned(12 DOWNTO 0) := (others => '0'); -- Initialize angle to 0
    SIGNAL clk : STD_LOGIC := '0'; -- Initialize clock
    SIGNAL sine_out : unsigned(12 DOWNTO 0);

    -- Component declaration
    COMPONENT sine_approximation
        PORT (
            angle : IN unsigned(12 DOWNTO 0);
            clk : IN STD_LOGIC;
            sine_out : OUT unsigned(12 DOWNTO 0)
        );
    END COMPONENT;

BEGIN

    -- Instantiation of the design under test
    i1 : sine_approximation
    PORT MAP (
        angle => angle,
        clk => clk,
        sine_out => sine_out
    );

    -- Clock process
    clk_process: PROCESS
    BEGIN
        while now < 500 ns loop  -- Simulation time 200 ns
            clk <= not clk;  -- Toggle the clock
            wait for 5 ns;  -- Clock period of 10 ns
        end loop;
        wait;
    END PROCESS clk_process;

    -- Stimulus process
    stimulus_process: PROCESS
    BEGIN
        -- Test with different input values

        angle <= "1000000000000";  -- Input value for angle (pi/4 = 4096)
        wait for 100 ns;  -- Wait for stable output

        angle <= "1010101010101";  -- Another input value for angle (pi/3 = 5461)
        wait for 100 ns;  -- Wait for stable output

        angle <= "0101010101011";  -- Another input value for angle (pi/6 = 2731)
        wait for 100 ns;  -- Wait for stable output

	angle <= "1010100101010";  -- Another input value for angle (pi/3 = 5461)
        wait for 100 ns;  -- Wait for stable output

	--angle <= "0101010101010";  -- Another input value for angle (29.02962254 degrees = 2642)
        --wait for 100 ns;  -- Wait for stable output

        --angle <= "0101010101010";  -- Another input value for angle (29.02962254 degrees = 2642)
        --wait for 100 ns;  -- Wait for stable output


        wait;
    END PROCESS stimulus_process;

END sine_approximation_arch;
