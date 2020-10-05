PROCESSOR 16F887
    
    #include <xc.inc>   
    CONFIG FOSC=INTRC_NOCLKOUT    
    CONFIG WDTE=OFF
    CONFIG PWRTE=ON
    CONFIG MCLRE=OFF
    CONFIG CP=OFF
    CONFIG CPD=OFF
    CONFIG BOREN=OFF
    CONFIG IESO=OFF
    CONFIG FCMEN=OFF
    CONFIG LVP=OFF
    CONFIG DEBUG=ON
    
    CONFIG BOR4V=BOR40V
    CONFIG WRT=OFF
     
      GLOBAL mul 
    PSECT udata
 mul:
    DS 1
   
    PSECT resetVEC,class=CODE, delta=2
    resetvec:
    PAGESEL main
    goto main
    
   PSECT code
    main:
    BANKSEL PORTA 
    BANKSEL TRISA
    clrf TRISA
    loop:
    movlw 0x00
    movwf PORTA
    nop
   ciclo1:
    RLF  PORTA,1
    BTFSS PORTA,7
    goto ciclo1
   ciclo2:
    RRF PORTA,1
    BTFSS PORTA,0
    goto ciclo2
    END