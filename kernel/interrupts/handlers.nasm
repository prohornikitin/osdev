extern printString

section .rodata



error_messages:
  .zero_division db "Zero Division Error", 0
  .general_protection db "General Protection Exception", 0
  .overflow db "INTO Instruction Has Been Executed", 0
  .double_fault db "Double fault", 0
  .invalid_opcode db "Invalid Opcode (Undefined Opcode)", 0
  .no_FPU db "No Math Coprocessor", 0
  .invalid_TSS db "Invlid TSS", 0
  .segment_not_present db "Segment Not Present", 0
  .stack_segment_fault db "Stack-Segment Fault", 0
  .page_fault db "Page Fault", 0
  .FPU_error db "FPU Error(Math Fault)", 0
  .alignment_check db "Alignemnt Check", 0
  .machine_check db "Machine Check", 0
  .virtualization_exception db "Virtualization Exception", 0
  .SIMD_FP_exception db "SIMD Floating-Point Exception", 0
  .BOUND_Range_Exceeded db "BOUND Range Exceeded", 0
  .Spurious_Interrupt db "Spurious Interrupt had been detected" ;Temporary stub
section .text

global handleInterrupt0
handleInterrupt0:
  push rdi
  mov rdi, error_messages.zero_division
  call printString
  pop rdi
  hlt
  ;TODO: exit program
  iretq

global handleInterrupt1
handleInterrupt1:
  ;TODO: debug exception
  iretq
  

global handleInterrupt2
handleInterrupt2:
  ;TODO: Non-maskable interrupt
  iretq

global handleInterrupt3
handleInterrupt3:
  ;TODO: breakpoint exception
  iretq

global handleInterrupt4
handleInterrupt4:
  push rdi
  mov rdi, error_messages.overflow
  call printString
  pop rdi
  hlt
  ;TODO: exit program
  iretq

global handleInterrupt5
handleInterrupt5:
  push rdi
  mov rdi, error_messages.BOUND_Range_Exceeded
  call printString
  pop rdi
  hlt ;TODO: exit program
  iretq

global handleInterrupt6
handleInterrupt6:
  push rdi
  mov rdi, error_messages.invalid_opcode
  call printString
  pop rdi
  hlt ;TODO: exit program
  iretq

global handleInterrupt7
handleInterrupt7:
  push rdi
  mov rdi, error_messages.no_FPU
  call printString
  pop rdi
  hlt ;TODO: exit program
  iretq

global handleInterrupt8
handleInterrupt8:
  push rdi
  mov rdi, error_messages.double_fault
  call printString
  pop rdi
  add rsp, 4; error code 0
  hlt ;TODO: exit program  
  iretq

global handleInterrupt9
handleInterrupt9:
  ;Coprocessor Segment Overrun #DEPRECATED#
  iretq

global handleInterrupt10
handleInterrupt10:
  push rdi
  mov rdi, error_messages.invalid_TSS
  call printString
  pop rdi
  add rsp, 4; TODO: use error code
  hlt ;TODO: exit program  
  iretq

global handleInterrupt11
handleInterrupt11:
  push rdi
  mov rdi, error_messages.segment_not_present
  call printString
  pop rdi
  add rsp, 4; TODO: use error code
  hlt ;TODO: exit program
  iretq

global handleInterrupt12
handleInterrupt12:
  push rdi
  mov rdi, error_messages.stack_segment_fault
  call printString
  pop rdi
  add rsp, 4; TODO: use error code
  hlt ;TODO: exit program
  iretq

global handleInterrupt13
handleInterrupt13:
  push rdi
  mov rdi, error_messages.general_protection
  call printString
  pop rdi
  add rsp, 4; TODO: use error code
  hlt ;TODO: exit
  iretq

global handleInterrupt14
handleInterrupt14:
  push rdi
  mov rdi, error_messages.page_fault
  call printString
  pop rdi
  add rsp, 4; TODO: use error code
  hlt ;TODO: exit
  iretq

global handleInterrupt15
handleInterrupt15:
  iretq

global handleInterrupt16
handleInterrupt16:
  push rdi
  mov rdi, error_messages.FPU_error
  call printString
  pop rdi
  hlt ;TODO: exit
  iretq

global handleInterrupt17
handleInterrupt17:
  push rdi
  mov rdi, error_messages.alignment_check
  call printString
  pop rdi
  add rsp, 4; error code 0
  hlt ;TODO: exit
  iretq

global handleInterrupt18
handleInterrupt18:
  push rdi
  mov rdi, error_messages.machine_check
  call printString
  pop rdi
  hlt ;TODO: exit
  iretq

global handleInterrupt19
handleInterrupt19:
  push rdi
  mov rdi, error_messages.SIMD_FP_exception
  call printString
  pop rdi
  hlt ;TODO: exit
  iretq

global handleInterrupt20
handleInterrupt20:
  push rdi
  mov rdi, error_messages.virtualization_exception
  call printString
  pop rdi
  hlt ;TODO: exit
  iretq

global handleInterrupt21
handleInterrupt21:
  iretq

global handleInterrupt22
handleInterrupt22:
  iretq

global handleInterrupt23
handleInterrupt23:
  iretq

global handleInterrupt24
handleInterrupt24:
  iretq

global handleInterrupt25
handleInterrupt25:
  iretq

global handleInterrupt26
handleInterrupt26:
  iretq

global handleInterrupt27
handleInterrupt27:
  iretq

global handleInterrupt28
handleInterrupt28:
  iretq

global handleInterrupt29
handleInterrupt29:
  iretq

global handleInterrupt30
handleInterrupt30:
  iretq

global handleInterrupt31
handleInterrupt31:
  iretq

global handleInterrupt32
handleInterrupt32:
  push rdi
  mov rdi, error_messages.Spurious_Interrupt
  call printString
  pop rdi
  hlt ;TODO: exit
  iretq

global handleInterrupt33
handleInterrupt33:
  push    dword 0
  push    dword 33
  

global handleInterrupt34
handleInterrupt34:
  push    dword 0
  push    dword 34
  

global handleInterrupt35
handleInterrupt35:
  push    dword 0
  push    dword 35
  

global handleInterrupt36
handleInterrupt36:
  push    dword 0
  push    dword 36
  

global handleInterrupt37
handleInterrupt37:
  push    dword 0
  push    dword 37
  

global handleInterrupt38
handleInterrupt38:
  push    dword 0
  push    dword 38
  

global handleInterrupt39
handleInterrupt39:
  push    dword 0
  push    dword 39
  

global handleInterrupt40
handleInterrupt40:
  push    dword 0
  push    dword 40
  

global handleInterrupt41
handleInterrupt41:
  push    dword 0
  push    dword 41
  

global handleInterrupt42
handleInterrupt42:
  push    dword 0
  push    dword 42
  

global handleInterrupt43
handleInterrupt43:
  push    dword 0
  push    dword 43
  

global handleInterrupt44
handleInterrupt44:
  push    dword 0
  push    dword 44
  

global handleInterrupt45
handleInterrupt45:
  push    dword 0
  push    dword 45
  

global handleInterrupt46
handleInterrupt46:
  push    dword 0
  push    dword 46
  

global handleInterrupt47
handleInterrupt47:
  push    dword 0
  push    dword 47
  

global handleInterrupt48
handleInterrupt48:
  push    dword 0
  push    dword 48
  

global handleInterrupt49
handleInterrupt49:
  iretq

global handleInterrupt50
handleInterrupt50:
  push    dword 0
  push    dword 50
  

global handleInterrupt51
handleInterrupt51:
  push    dword 0
  push    dword 51
  

global handleInterrupt52
handleInterrupt52:
  push    dword 0
  push    dword 52
  

global handleInterrupt53
handleInterrupt53:
  push    dword 0
  push    dword 53
  

global handleInterrupt54
handleInterrupt54:
  push    dword 0
  push    dword 54
  

global handleInterrupt55
handleInterrupt55:
  push    dword 0
  push    dword 55
  

global handleInterrupt56
handleInterrupt56:
  push    dword 0
  push    dword 56
  

global handleInterrupt57
handleInterrupt57:
  push    dword 0
  push    dword 57
  

global handleInterrupt58
handleInterrupt58:
  push    dword 0
  push    dword 58
  

global handleInterrupt59
handleInterrupt59:
  push    dword 0
  push    dword 59
  

global handleInterrupt60
handleInterrupt60:
  push    dword 0
  push    dword 60
  

global handleInterrupt61
handleInterrupt61:
  push    dword 0
  push    dword 61
  

global handleInterrupt62
handleInterrupt62:
  push    dword 0
  push    dword 62
  

global handleInterrupt63
handleInterrupt63:
  push    dword 0
  push    dword 63
  

global handleInterrupt64
handleInterrupt64:
  push    dword 0
  push    dword 64
  

global handleInterrupt65
handleInterrupt65:
  push    dword 0
  push    dword 65
  

global handleInterrupt66
handleInterrupt66:
  push    dword 0
  push    dword 66
  

global handleInterrupt67
handleInterrupt67:
  push    dword 0
  push    dword 67
  

global handleInterrupt68
handleInterrupt68:
  push    dword 0
  push    dword 68
  

global handleInterrupt69
handleInterrupt69:
  push    dword 0
  push    dword 69
  

global handleInterrupt70
handleInterrupt70:
  push    dword 0
  push    dword 70
  

global handleInterrupt71
handleInterrupt71:
  push    dword 0
  push    dword 71
  

global handleInterrupt72
handleInterrupt72:
  push    dword 0
  push    dword 72
  

global handleInterrupt73
handleInterrupt73:
  push    dword 0
  push    dword 73
  

global handleInterrupt74
handleInterrupt74:
  push    dword 0
  push    dword 74
  

global handleInterrupt75
handleInterrupt75:
  push    dword 0
  push    dword 75
  

global handleInterrupt76
handleInterrupt76:
  push    dword 0
  push    dword 76
  

global handleInterrupt77
handleInterrupt77:
  push    dword 0
  push    dword 77
  

global handleInterrupt78
handleInterrupt78:
  push    dword 0
  push    dword 78
  

global handleInterrupt79
handleInterrupt79:
  push    dword 0
  push    dword 79
  

global handleInterrupt80
handleInterrupt80: 
  push    dword 0
  push    dword 80
  

global handleInterrupt81
handleInterrupt81:
  push    dword 0
  push    dword 81
  

global handleInterrupt82
handleInterrupt82:
  push    dword 0
  push    dword 82
  

global handleInterrupt83
handleInterrupt83:
  push    dword 0
  push    dword 83
  

global handleInterrupt84
handleInterrupt84:
  push    dword 0
  push    dword 84
  

global handleInterrupt85
handleInterrupt85:
  push    dword 0
  push    dword 85
  

global handleInterrupt86
handleInterrupt86:
  push    dword 0
  push    dword 86
  

global handleInterrupt87
handleInterrupt87:
  push    dword 0
  push    dword 87
  

global handleInterrupt88
handleInterrupt88:
  push    dword 0
  push    dword 88
  

global handleInterrupt89
handleInterrupt89:
  push    dword 0
  push    dword 89
  

global handleInterrupt90
handleInterrupt90:
  push    dword 0
  push    dword 90
  

global handleInterrupt91
handleInterrupt91:
  push    dword 0
  push    dword 91
  

global handleInterrupt92
handleInterrupt92:
  push    dword 0
  push    dword 92
  

global handleInterrupt93
handleInterrupt93:
  push    dword 0
  push    dword 93
  

global handleInterrupt94
handleInterrupt94:
  push    dword 0
  push    dword 94
  

global handleInterrupt95
handleInterrupt95:
  push    dword 0
  push    dword 95
  

global handleInterrupt96
handleInterrupt96:
  push    dword 0
  push    dword 96
  

global handleInterrupt97
handleInterrupt97:
  push    dword 0
  push    dword 97
  

global handleInterrupt98
handleInterrupt98:
  push    dword 0
  push    dword 98
  

global handleInterrupt99
handleInterrupt99:
  push    dword 0
  push    dword 99
  

global handleInterrupt100
handleInterrupt100:
  push    dword 0
  push    dword 100
  

global handleInterrupt101
handleInterrupt101:
  push    dword 0
  push    dword 101
  

global handleInterrupt102
handleInterrupt102:
  push    dword 0
  push    dword 102
  

global handleInterrupt103
handleInterrupt103:
  push    dword 0
  push    dword 103
  

global handleInterrupt104
handleInterrupt104:
  push    dword 0
  push    dword 104
  

global handleInterrupt105
handleInterrupt105:
  push    dword 0
  push    dword 105
  

global handleInterrupt106
handleInterrupt106:
  push    dword 0
  push    dword 106
  

global handleInterrupt107
handleInterrupt107:
  push    dword 0
  push    dword 107
  

global handleInterrupt108
handleInterrupt108:
  push    dword 0
  push    dword 108
  

global handleInterrupt109
handleInterrupt109:
  push    dword 0
  push    dword 109
  

global handleInterrupt110
handleInterrupt110:
  push    dword 0
  push    dword 110
  

global handleInterrupt111
handleInterrupt111:
  push    dword 0
  push    dword 111
  

global handleInterrupt112
handleInterrupt112:
  push    dword 0
  push    dword 112
  

global handleInterrupt113
handleInterrupt113:
  push    dword 0
  push    dword 113
  

global handleInterrupt114
handleInterrupt114:
  push    dword 0
  push    dword 114
  

global handleInterrupt115
handleInterrupt115:
  push    dword 0
  push    dword 115
  

global handleInterrupt116
handleInterrupt116:
  push    dword 0
  push    dword 116
  

global handleInterrupt117
handleInterrupt117:
  push    dword 0
  push    dword 117
  

global handleInterrupt118
handleInterrupt118:
  push    dword 0
  push    dword 118
  

global handleInterrupt119
handleInterrupt119:
  push    dword 0
  push    dword 119
  

global handleInterrupt120
handleInterrupt120:
  push    dword 0
  push    dword 120
  

global handleInterrupt121
handleInterrupt121:
  push    dword 0
  push    dword 121
  

global handleInterrupt122
handleInterrupt122:
  push    dword 0
  push    dword 122
  

global handleInterrupt123
handleInterrupt123:
  push    dword 0
  push    dword 123
  

global handleInterrupt124
handleInterrupt124:
  push    dword 0
  push    dword 124
  

global handleInterrupt125
handleInterrupt125:
  push    dword 0
  push    dword 125
  

global handleInterrupt126
handleInterrupt126:
  push    dword 0
  push    dword 126
  

global handleInterrupt127
handleInterrupt127:
  push    dword 0
  push    dword 127
  

global handleInterrupt128
handleInterrupt128:
  push    dword 0
  push    dword 128

global handleInterrupt129
handleInterrupt129:
  push    dword 0
  push    dword 129
  

global handleInterrupt130
handleInterrupt130:
  push    dword 0
  push    dword 130
  

global handleInterrupt131
handleInterrupt131:
  push    dword 0
  push    dword 131
  

global handleInterrupt132
handleInterrupt132:
  push    dword 0
  push    dword 132
  

global handleInterrupt133
handleInterrupt133:
  push    dword 0
  push    dword 133
  

global handleInterrupt134
handleInterrupt134:
  push    dword 0
  push    dword 134
  

global handleInterrupt135
handleInterrupt135:
  push    dword 0
  push    dword 135
  

global handleInterrupt136
handleInterrupt136:
  push    dword 0
  push    dword 136
  

global handleInterrupt137
handleInterrupt137:
  push    dword 0
  push    dword 137
  

global handleInterrupt138
handleInterrupt138:
  push    dword 0
  push    dword 138
  

global handleInterrupt139
handleInterrupt139:
  push    dword 0
  push    dword 139
  

global handleInterrupt140
handleInterrupt140:
  push    dword 0
  push    dword 140
  

global handleInterrupt141
handleInterrupt141:
  push    dword 0
  push    dword 141
  

global handleInterrupt142
handleInterrupt142:
  push    dword 0
  push    dword 142
  

global handleInterrupt143
handleInterrupt143:
  push    dword 0
  push    dword 143
  

global handleInterrupt144
handleInterrupt144:
  push    dword 0
  push    dword 144
  

global handleInterrupt145
handleInterrupt145:
  push    dword 0
  push    dword 145
  

global handleInterrupt146
handleInterrupt146:
  push    dword 0
  push    dword 146
  

global handleInterrupt147
handleInterrupt147:
  push    dword 0
  push    dword 147
  

global handleInterrupt148
handleInterrupt148:
  push    dword 0
  push    dword 148
  

global handleInterrupt149
handleInterrupt149:
  push    dword 0
  push    dword 149
  

global handleInterrupt150
handleInterrupt150:
  push    dword 0
  push    dword 150
  

global handleInterrupt151
handleInterrupt151:
  push    dword 0
  push    dword 151
  

global handleInterrupt152
handleInterrupt152:
  push    dword 0
  push    dword 152
  

global handleInterrupt153
handleInterrupt153:
  push    dword 0
  push    dword 153
  

global handleInterrupt154
handleInterrupt154:
  push    dword 0
  push    dword 154
  

global handleInterrupt155
handleInterrupt155:
  push    dword 0
  push    dword 155
  

global handleInterrupt156
handleInterrupt156:
  push    dword 0
  push    dword 156
  

global handleInterrupt157
handleInterrupt157:
  push    dword 0
  push    dword 157
  

global handleInterrupt158
handleInterrupt158:
  push    dword 0
  push    dword 158
  

global handleInterrupt159
handleInterrupt159:
  push    dword 0
  push    dword 159
  

global handleInterrupt160
handleInterrupt160:
  push    dword 0
  push    dword 160
  

global handleInterrupt161
handleInterrupt161:
  push    dword 0
  push    dword 161
  

global handleInterrupt162
handleInterrupt162:
  push    dword 0
  push    dword 162
  

global handleInterrupt163
handleInterrupt163:
  push    dword 0
  push    dword 163
  

global handleInterrupt164
handleInterrupt164:
  push    dword 0
  push    dword 164
  

global handleInterrupt165
handleInterrupt165:
  push    dword 0
  push    dword 165
  

global handleInterrupt166
handleInterrupt166:
  push    dword 0
  push    dword 166
  

global handleInterrupt167
handleInterrupt167:
  push    dword 0
  push    dword 167
  

global handleInterrupt168
handleInterrupt168:
  push    dword 0
  push    dword 168
  

global handleInterrupt169
handleInterrupt169:
  push    dword 0
  push    dword 169
  

global handleInterrupt170
handleInterrupt170:
  push    dword 0
  push    dword 170
  

global handleInterrupt171
handleInterrupt171:
  push    dword 0
  push    dword 171
  

global handleInterrupt172
handleInterrupt172:
  push    dword 0
  push    dword 172
  

global handleInterrupt173
handleInterrupt173:
  push    dword 0
  push    dword 173
  

global handleInterrupt174
handleInterrupt174:
  push    dword 0
  push    dword 174
  

global handleInterrupt175
handleInterrupt175:
  push    dword 0
  push    dword 175
  

global handleInterrupt176
handleInterrupt176:
  push    dword 0
  push    dword 176
  

global handleInterrupt177
handleInterrupt177:
  push    dword 0
  push    dword 177
  

global handleInterrupt178
handleInterrupt178:
  push    dword 0
  push    dword 178
  

global handleInterrupt179
handleInterrupt179:
  push    dword 0
  push    dword 179
  

global handleInterrupt180
handleInterrupt180:
  push    dword 0
  push    dword 180
  

global handleInterrupt181
handleInterrupt181:
  push    dword 0
  push    dword 181
  

global handleInterrupt182
handleInterrupt182:
  push    dword 0
  push    dword 182
  

global handleInterrupt183
handleInterrupt183:
  push    dword 0
  push    dword 183
  

global handleInterrupt184
handleInterrupt184:
  push    dword 0
  push    dword 184
  

global handleInterrupt185
handleInterrupt185:
  push    dword 0
  push    dword 185
  

global handleInterrupt186
handleInterrupt186:
  push    dword 0
  push    dword 186
  

global handleInterrupt187
handleInterrupt187:
  push    dword 0
  push    dword 187
  

global handleInterrupt188
handleInterrupt188:
  push    dword 0
  push    dword 188
  

global handleInterrupt189
handleInterrupt189:
  push    dword 0
  push    dword 189
  

global handleInterrupt190
handleInterrupt190:
  push    dword 0
  push    dword 190
  

global handleInterrupt191
handleInterrupt191:
  push    dword 0
  push    dword 191
  

global handleInterrupt192
handleInterrupt192:
  push    dword 0
  push    dword 192
  

global handleInterrupt193
handleInterrupt193:
  push    dword 0
  push    dword 193
  

global handleInterrupt194
handleInterrupt194:
  push    dword 0
  push    dword 194
  

global handleInterrupt195
handleInterrupt195:
  push    dword 0
  push    dword 195
  

global handleInterrupt196
handleInterrupt196:
  push    dword 0
  push    dword 196
  

global handleInterrupt197
handleInterrupt197:
  push    dword 0
  push    dword 197
  

global handleInterrupt198
handleInterrupt198:
  push    dword 0
  push    dword 198
  

global handleInterrupt199
handleInterrupt199:
  push    dword 0
  push    dword 199
  

global handleInterrupt200
handleInterrupt200:
  push    dword 0
  push    dword 200
  

global handleInterrupt201
handleInterrupt201:
  push    dword 0
  push    dword 201
  

global handleInterrupt202
handleInterrupt202:
  push    dword 0
  push    dword 202
  

global handleInterrupt203
handleInterrupt203:
  push    dword 0
  push    dword 203
  

global handleInterrupt204
handleInterrupt204:
  push    dword 0
  push    dword 204
  

global handleInterrupt205
handleInterrupt205:
  push    dword 0
  push    dword 205
  

global handleInterrupt206
handleInterrupt206:
  push    dword 0
  push    dword 206
  

global handleInterrupt207
handleInterrupt207:
  push    dword 0
  push    dword 207
  

global handleInterrupt208
handleInterrupt208:
  push    dword 0
  push    dword 208
  

global handleInterrupt209
handleInterrupt209:
  push    dword 0
  push    dword 209
  

global handleInterrupt210
handleInterrupt210:
  push    dword 0
  push    dword 210
  

global handleInterrupt211
handleInterrupt211:
  push    dword 0
  push    dword 211
  

global handleInterrupt212
handleInterrupt212:
  push    dword 0
  push    dword 212
  

global handleInterrupt213
handleInterrupt213:
  push    dword 0
  push    dword 213
  

global handleInterrupt214
handleInterrupt214:
  push    dword 0
  push    dword 214
  

global handleInterrupt215
handleInterrupt215:
  push    dword 0
  push    dword 215
  

global handleInterrupt216
handleInterrupt216:
  push    dword 0
  push    dword 216
  

global handleInterrupt217
handleInterrupt217:
  push    dword 0
  push    dword 217
  

global handleInterrupt218
handleInterrupt218:
  push    dword 0
  push    dword 218
  

global handleInterrupt219
handleInterrupt219:
  push    dword 0
  push    dword 219
  

global handleInterrupt220
handleInterrupt220:
  push    dword 0
  push    dword 220
  

global handleInterrupt221
handleInterrupt221:
  push    dword 0
  push    dword 221
  

global handleInterrupt222
handleInterrupt222:
  push    dword 0
  push    dword 222
  

global handleInterrupt223
handleInterrupt223:
  push    dword 0
  push    dword 223
  

global handleInterrupt224
handleInterrupt224:
  push    dword 0
  push    dword 224
  

global handleInterrupt225
handleInterrupt225:
  push    dword 0
  push    dword 225
  

global handleInterrupt226
handleInterrupt226:
  push    dword 0
  push    dword 226
  

global handleInterrupt227
handleInterrupt227:
  push    dword 0
  push    dword 227
  

global handleInterrupt228
handleInterrupt228:
  push    dword 0
  push    dword 228
  

global handleInterrupt229
handleInterrupt229:
  push    dword 0
  push    dword 229
  

global handleInterrupt230
handleInterrupt230:
  push    dword 0
  push    dword 230
  

global handleInterrupt231
handleInterrupt231:
  push    dword 0
  push    dword 231
  

global handleInterrupt232
handleInterrupt232:
  push    dword 0
  push    dword 232
  

global handleInterrupt233
handleInterrupt233:
  push    dword 0
  push    dword 233
  

global handleInterrupt234
handleInterrupt234:
  push    dword 0
  push    dword 234
  

global handleInterrupt235
handleInterrupt235:
  push    dword 0
  push    dword 235
  

global handleInterrupt236
handleInterrupt236:
  push    dword 0
  push    dword 236
  

global handleInterrupt237
handleInterrupt237:
  push    dword 0
  push    dword 237
  

global handleInterrupt238
handleInterrupt238:
  push    dword 0
  push    dword 238
  

global handleInterrupt239
handleInterrupt239:
  push    dword 0
  push    dword 239
  

global handleInterrupt240
handleInterrupt240:
  push    dword 0
  push    dword 240
  

global handleInterrupt241
handleInterrupt241:
  push    dword 0
  push    dword 241
  

global handleInterrupt242
handleInterrupt242:
  push    dword 0
  push    dword 242
  

global handleInterrupt243
handleInterrupt243:
  push    dword 0
  push    dword 243
  

global handleInterrupt244
handleInterrupt244:
  push    dword 0
  push    dword 244
  

global handleInterrupt245
handleInterrupt245:
  push    dword 0
  push    dword 245
  

global handleInterrupt246
handleInterrupt246:
  push    dword 0
  push    dword 246
  

global handleInterrupt247
handleInterrupt247:
  push    dword 0
  push    dword 247
  

global handleInterrupt248
handleInterrupt248:
  push    dword 0
  push    dword 248
  

global handleInterrupt249
handleInterrupt249:
  push    dword 0
  push    dword 249
  

global handleInterrupt250
handleInterrupt250:
  push    dword 0
  push    dword 250
  

global handleInterrupt251
handleInterrupt251:
  push    dword 0
  push    dword 251
  

global handleInterrupt252
handleInterrupt252:
  push    dword 0
  push    dword 252
  

global handleInterrupt253
handleInterrupt253:
  push    dword 0
  push    dword 253
  

global handleInterrupt254
handleInterrupt254:
  push    dword 0
  push    dword 254
  

global handleInterrupt255
handleInterrupt255:
  push    dword 0
  push    dword 255
  
