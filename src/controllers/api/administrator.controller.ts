import { Body, Controller, Get, Param, Patch, Post, Put, UseGuards } from "@nestjs/common";
import { Administrator } from "src/entities/administrator.entity";
import { AddAdministratorDto } from "src/dtos/administrator/add.administrator.dto";
import { EditAdministratorDto } from "src/dtos/administrator/edit.administrator.dto";
import { ApiResponse } from "src/misc/api.response.class";
import { AdministratorService } from "src/services/administrator/administrator.service";
import { AllowToRoles } from "src/misc/allow.to.roles.descriptor";
import { RoleCheckedGuard } from "src/misc/role.checker.guard";

@Controller('api/administrator')
export class AdministratorController {
    constructor(
        private administratorService: AdministratorService
    ) { }

    @Get() // GET: http://localhost:3000/api/administrator/
    @UseGuards(RoleCheckedGuard)
    @AllowToRoles('administrator')
    getAll(): Promise<Administrator[]> {
        return this.administratorService.getAll();
    }

    @Get(':id') // GET: http://localhost:3000/api/administrator/4/
    @UseGuards(RoleCheckedGuard)
    @AllowToRoles('administrator')
    getById( @Param('id') administratorId: number): Promise<Administrator | ApiResponse> {
        return new Promise(async (resolve) => {
            let admin = await this.administratorService.getById(administratorId);

            if(admin === undefined) {
                resolve(new ApiResponse("error", -1002));
            }

            resolve(admin);
        });
        
    }

    // Dodavanje novog administratora
    // POST Metod: Kada radimo dodavanje novih zapisa koristimo @Put metod
    @Post() // PUT: http://localhost:3000/api/administrator/
    @UseGuards(RoleCheckedGuard)
    @AllowToRoles('administrator')
    add(@Body() data: AddAdministratorDto): Promise<Administrator | ApiResponse> {
        return this.administratorService.add(data); // data je DTO
    }

    // Izmena Administratora
    // PATCH Metod obecava da cemo moci da editujemo informacije o administratoru ALI SAMO PASSWORD SE MENJA
    // PATCH Metod sluzi za editovanje
    @Patch(':id') // GET: http://localhost:3000/api/administrator/4/
    @UseGuards(RoleCheckedGuard)
    @AllowToRoles('administrator')
    edit(@Param('id') id: number, @Body() data: EditAdministratorDto): Promise<Administrator | ApiResponse> {
        return this.administratorService.editById(id, data);
    }
}
