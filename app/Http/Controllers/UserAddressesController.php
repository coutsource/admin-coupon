<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\UserAddress;
use App\Http\Requests\UserAddressRequest;
use Illuminate\Support\Facades\Auth;

class UserAddressesController extends Controller
{
    public function index(Request $request)
    {
        return view('user_addresses.index', [
            'addresses' => $request->user()->addresses,
        ]);
    }

    public function create()
    {
        return view('user_addresses.create_and_edit', ['address' => new UserAddress()]);
    }

    public function store(UserAddressRequest $request)
    {
        $request->user()->addresses()->create($request->only([
            'province',
            'city',
            'district',
            'address',
            'zip',
            'contact_name',
            'contact_phone',
        ]));

        return redirect()->route('user_addresses.index');
    }

    public function edit(UserAddress $user_address)
    {
        $this->authorize('own', $user_address);

        return view('user_addresses.create_and_edit', ['address' => $user_address]);
    }

    public function update(UserAddress $user_address, UserAddressRequest $request)
    {
        $this->authorize('own', $user_address);
        $user_address->update($request->only([
            'province',
            'city',
            'district',
            'address',
            'zip',
            'contact_name',
            'contact_phone',
        ]));

        return redirect()->route('user_addresses.index');
    }

    public function destroy(UserAddress $user_address)
    {
        $this->authorize('own', $user_address);
        $user_address->delete();
        return [];
    }

    // api
    public function apiIndex(Request $request)
    {
        return response()->json($request->user()->addresses()->get()->toArray());
    }

    public function apiUpdate(UserAddress $user_address, UserAddressRequest $request) {
        return response()->json($request->user()->addresses()->update($request->only([
            'province',
            'city',
            'district',
            'address',
            'zip',
            'area_code',
            'contact_name',
            'contact_phone',
        ])));
    }

    public function apiDestroy($id) {
        $userAddress = UserAddress::findOrFail($id);
        $userAddress->delete();
    }

    public function apiStore(Request $request)
    {
        $user = Auth::guard('api')->user(); 
        if ($user) {
            $userAddress = new UserAddress();
            $userAddress->user_id = $user->id;
            $userAddress->province = $request->post('province');
            $userAddress->city = $request->post('city');
            $userAddress->district = $request->post('county');
            $userAddress->address = $request->post('addressDetail');
            $userAddress->area_code = $request->post('areaCode');
            $userAddress->zip = $request->post('postal_code');
            $userAddress->contact_name = $request->post('name');
            $userAddress->contact_phone = $request->post('tel');
            $userAddress->save();
            return response()->json($userAddress);
        }
        return response()->json($request->user()->addresses()->get()->toArray());
    }
}
